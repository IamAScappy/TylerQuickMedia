//
//  MediumBoundResource.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

struct RequestParam {
    let keyword: String
    let sortOptions: SearchSortType
    let searchOptions: SearchCategoryOptionType

    public init(keyword: String, sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType) {
        self.keyword = keyword
        self.sortOptions = sortOptions
        self.searchOptions = searchOptions
    }
}

class MediumBoundResource: DataBoundResourceType, TimeRateLimitable {
    typealias REQ = RequestParam
    typealias NEXTREQ = String
    typealias DATA = [Medium]

    var freshTime: Int = 20 * 60 // 20 minute

    var result: Single<[Medium]>?
    private let remote: MediumRemoteSourceType
    private let local: MediumLocalSourceType
    private let dispatchQueue = DispatchQueue(label: "test")

    init(remote: MediumRemoteSourceType, local: MediumLocalSourceType) {
        self.remote = remote
        self.local = local
    }

    internal func needFresh(lastestDate: Date) -> Bool {
        if lastestDate.timeIntervalSinceNow.advanced(by: Double(-freshTime)) < 0 {
            return false
        } else {
            return true
        }
    }
    func nextPage(_ keyword: String) -> PrimitiveSequence<SingleTrait, [Medium]> {
        guard let searchResult = self.local.getSearchResult(keyword) else { return Single.just([]) }
        let requestParam = RequestParam(keyword: keyword, sortOptions: searchResult.sortType, searchOptions: SearchCategoryOptionType.init(rawValue: searchResult.categoryType))
        return self.createRemoteCall(requestParam, searchResult: searchResult)
    }
    
    func request(_ req: RequestParam) -> PrimitiveSequence<SingleTrait, [Medium]> {
        guard let searchResult = self.local.getSearchResult(req.keyword) else { return self.createRemoteCall(req, searchResult: MediumSearchResult(query: req.keyword)) }
        if shouldFetch(req, searchResult: searchResult) {
            return self.createRemoteCall(req, searchResult: searchResult)
        } else {
            let data = self.loadFromLocal(req, mediumIds: Array(searchResult.medium_ids))
            if data.isEmpty {
                return self.createRemoteCall(req, searchResult: searchResult)
            } else {
                return Single.just(data)
            }
        }
    }

    func saveResult(data: [Medium]) {
        self.local.save(obj: data, update: false)
    }

    func shouldFetch(_ req: RequestParam, searchResult: MediumSearchResult?) -> Bool {
        guard let result = searchResult else { return true }
        return self.needFresh(lastestDate: result.updatedTime)
    }

    func loadFromLocal(_ req: RequestParam, mediumIds: [String]) -> [Medium] {
        logger.debug("loadFromLocal request: [\(req)]")
        return self.local.getMedium(mediumIds)
    }
    
    func createRemoteCall(_ req: RequestParam, searchResult: MediumSearchResult) -> PrimitiveSequence<SingleTrait, [Medium]> {
        let nextInfo = searchResult.nextInfo ?? NextInfo()
        return self.remote.searchMedium(req.keyword, nextInfo: nextInfo , sortOptions: req.sortOptions, searchOptions: req.searchOptions)
            .map { [unowned self] proccessingMediums in
                let medium = proccessingMediums.flatMap({ $0.items })
                self.saveResult(data: medium)
                let mediumIds = medium.map { $0.id }
                searchResult.medium_ids.append(objectsIn: mediumIds)
                searchResult.nextInfo = NextInfo(pageInfos: proccessingMediums.map { $0.pageInfo })
                self.local.save(obj: searchResult, update: true)
                logger.debug("realm added query: [\(req.keyword)] pages: [\(searchResult.nextInfo)] ids: [\(String(describing: searchResult.medium_ids.count))]")
                let data = self.local.getMedium(mediumIds)
                logger.debug("realm medium: [\(data.count)]")
                return data
        }
    }
}

