//
//  MediumRepositoryType.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 23..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

class MediumRepository: MediumRepositoryType {
    private let remote: MediumRemoteSourceType
    private let scheduler: RxDispatchQueue
    init(remote: MediumRemoteSourceType, scheduler: RxDispatchQueue) {
        self.remote = remote
        self.scheduler = scheduler
    }

    func nextMedium(
        _ keyword: String) -> Single<[Medium]> {
        guard !keyword.isEmpty else { return Single.just([]) }
        logger.debug("next page keyword: [\(keyword)]")
        
        guard let searchResult = MediumSearchResult.query(keyword).last else { return Single.just([]) }
        let requestParam = RequestParam(keyword: keyword, sortOptions: searchResult.sortType, searchOptions: SearchCategoryOptionType(rawValue: searchResult.categoryType))
        return self.createRemoteCall(requestParam, searchResult: searchResult)
    }
    func searchMedium(
        _ keyword: String,
        searchOptions: SearchCategoryOptionType = SearchCategoryOptionType.all,
        sortOptions: SearchSortType = .recency) -> Single<[Medium]> {
        guard !keyword.isEmpty else { return Single.just([]) }
        logger.debug("request keyword: [\(keyword)] searchOptions: [\(searchOptions)] sortOptions: [\(sortOptions)]")
        let request = RequestParam(keyword: keyword, sortOptions: sortOptions, searchOptions: searchOptions)
        guard let searchResult = MediumSearchResult.query(keyword).last else { return self.createRemoteCall(request, searchResult: MediumSearchResult(query: keyword, sortType: SearchSortType.defaultType)) }
        if shouldFetch(request, searchResult: searchResult) {
            return self.createRemoteCall(request, searchResult: searchResult)
        } else {
            let data = self.loadFromLocal(request, mediumIds: Array(searchResult.medium_ids))
            if data.isEmpty {
                return self.createRemoteCall(request, searchResult: searchResult)
            } else {
                return Single.just(data)
            }
        }
    }
}

extension MediumRepository {
    func saveResult(data: [Medium]) {
        data.save()
    }
    
    func shouldFetch(_ req: RequestParam, searchResult: MediumSearchResult?) -> Bool {
        guard let result = searchResult else { return true }
        return self.needFresh(lastestDate: result.updatedTime)
    }
    
    func loadFromLocal(_ req: RequestParam, mediumIds: [String]) -> [Medium] {
        logger.debug("loadFromLocal request: [\(req)]")
        return mediumIds.getMediumFromIds()
    }
    
    func createRemoteCall(_ req: RequestParam, searchResult: MediumSearchResult) -> PrimitiveSequence<SingleTrait, [Medium]> {
        let nextInfo = searchResult.nextInfo ?? NextInfo()
        return self.remote.searchMedium(req.keyword, nextInfo: nextInfo, sortOptions: req.sortOptions, searchOptions: req.searchOptions)
            .subscribeOn(self.scheduler.network)
            .observeOn(self.scheduler.io)
            .map { [unowned self] proccessingMediums in
                let medium = proccessingMediums.flatMap({ $0.items })
                medium.save()
                let mediumIds = medium.map { $0.id }
                searchResult.medium_ids.append(objectsIn: mediumIds)
                searchResult.nextInfo = NextInfo(pageInfos: proccessingMediums.map { $0.pageInfo })
                searchResult.save()
                let data = mediumIds.getMediumFromIds()
                logger.debug("realm added query: [\(req.keyword)] pages: [\(String(describing: searchResult.nextInfo))] ids: [\(String(describing: searchResult.medium_ids.count))] medium: [\(data.count)]")
                return data
        }
    }
}
extension MediumRepository: TimeRateLimitable {
    var freshTime: Int {
        return 20 * 60 // 20 minute
    }
    
    internal func needFresh(lastestDate: Date) -> Bool {
        if lastestDate.timeIntervalSinceNow.advanced(by: Double(-freshTime)) < 0 {
            return false
        } else {
            return true
        }
    }
}

fileprivate extension Array where Element == String {
    func getMediumFromIds() -> [Medium] {
        let realm = try? Realm()
        return realm?.filter(
            parentType: Medium.self,
            subclasses: [KakaoImage.self, NaverImage.self, KakaoVclip.self],
            predicate: NSPredicate(format: "id IN %@", self)) ?? []
    }
}
