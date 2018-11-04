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
    
    init(remote: MediumRemoteSourceType) {
        self.remote = remote
    }

    func nextMedium(
        _ keyword: String,
        searchOptions: SearchCategoryOptionType = SearchCategoryOptionType.all,
        sortOptions: SearchSortType = .recency) -> Single<[MediumViewModel]> {
        guard !keyword.isEmpty else { return Single.just([]) }
        logger.debug("next page keyword: [\(getThreadName())] [\(keyword)]")

        guard let searchResult = MediumSearchResult.findSearchResultById(keyword, sortType: sortOptions) else { return Single.just([]) }
        return self.createRemoteCall(searchResult: searchResult)
    }

    func searchMedium(
        _ keyword: String,
        searchOptions: SearchCategoryOptionType = SearchCategoryOptionType.all,
        sortOptions: SearchSortType = .recency) -> Single<[MediumViewModel]> {
        guard !keyword.isEmpty else { return Single.just([]) }
        logger.debug("[\(getThreadName())] request keyword: [\(keyword)] searchOptions: [\(searchOptions)] sortOptions: [\(sortOptions.rawValue)]")
        guard let searchResult = MediumSearchResult.findSearchResultById(keyword, sortType: sortOptions) else {
            let searchResult = MediumSearchResult(query: keyword)
            searchResult.save()
            return createRemoteCall(searchResult: searchResult)
        }
        
        if shouldFetch(searchResult: searchResult) {
            return self.createRemoteCall(searchResult: searchResult)
        } else {
            let data = self.loadFromLocal(mediumIds: Array(searchResult.medium_ids))
            if data.isEmpty {
                return self.createRemoteCall(searchResult: searchResult)
            } else {
                return Single.just(data.map { $0.viewModel })
            }
        }
    }
}

extension MediumRepository {
    func saveResult(data: [Medium]) {
        data.save()
    }

    func shouldFetch(searchResult: MediumSearchResult?) -> Bool {
        guard let result = searchResult else { return true }
        return self.needFresh(lastestDate: result.updatedTime)
    }

    func loadFromLocal(mediumIds: [String]) -> [Medium] {
        logger.debug("loadFromLocal request")
        return mediumIds.getMediumFromIds()
    }

    func createRemoteCall(searchResult: MediumSearchResult) -> PrimitiveSequence<SingleTrait, [MediumViewModel]> {
        logger.info("\(getThreadName())")
        let searchResultRef = ThreadSafeReference(to: searchResult)
        return self.remote.searchMedium(searchResult: searchResult)
            .map { (nextInfo, mediums) in
                logger.info("\(getThreadName())")
                let realm = try? Realm()
                guard let searchResult = realm?.resolve(searchResultRef) else { return [] }
                try? realm?.write {
                    realm?.add(mediums, update: true)
                    searchResult.medium_ids.append(objectsIn: mediums.map { $0.id })
                    searchResult.nextInfo = nextInfo
                    realm?.add(searchResult, update: true)
                }
                let data = Array(searchResult.medium_ids).getMediumFromIds()
                logger.debug("realm added query: [\(getThreadName())] [\(searchResult.query)] pages: [\(String(describing: searchResult.nextInfo))] ids: [\(String(describing: searchResult.medium_ids.count))] medium: [\(data.count)]")
                return data.map { $0.viewModel }
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
