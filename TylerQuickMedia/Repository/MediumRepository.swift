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

class MediumRepository: MediumRepositoryType, RateLimitable {
    private let service: MediumRemoteSourceType

    init(_ service: MediumRemoteSourceType) {
        self.service = service
    }

    func mustFresh(_ fresh: Bool) {
        if fresh {
            freshTime = -1
        } else {
            freshTime = 20 * 60
        }
    }
    func shouldFetch(lastestDate: Date) -> Bool {
        if lastestDate.timeIntervalSinceNow.advanced(by: Double(-freshTime)) < 0 {
            return false
        } else {
            return true
        }
    }

    var freshTime: Int = 20 * 60 // 20 minute

    private func getNextInfo(_ keyword: String) throws -> NextInfo? {
        let realm = try Realm()
        let result = realm.objects(MediumSearchResult.self).filter("query = '\(keyword)'")
        if result.isEmpty {
            try realm.write {
                realm.add(MediumSearchResult(query: keyword), update: true)
            }
        }
        return realm.objects(MediumSearchResult.self).filter("query = '\(keyword)'").last?.nextInfo
    }
    
    func searchMedium(
        _ keyword: String,
        searchOptions: SearchCategoryOptionType = SearchCategoryOptionType.all,
        sortOptions: SearchSortType = .recency) -> Single<[Medium]> {
        guard !keyword.isEmpty else { return Single.just([]) }

        var nextInfo: NextInfo?
        do {
            nextInfo = try getNextInfo(keyword)
        } catch let error {
            logger.error("error: \(error)")
        }
        guard let next = nextInfo else { return Single.just([]) }
        return self.service.searchMedium(keyword, nextInfo: next, sortOptions: sortOptions, searchOptions: searchOptions)
            .observeOn(SerialDispatchQueueScheduler(qos: .userInteractive))
            .map { proccessingMediums in
                var viewItems: [Medium] = []
                do {
                    let mediums = proccessingMediums.flatMap({ $0.items })
                    let pageInfos = proccessingMediums.compactMap { $0.pageInfo }

                    let realm = try Realm()
                    
                    let result = realm.objects(MediumSearchResult.self).filter(NSPredicate(format: "query == %@", keyword)).last ?? MediumSearchResult(query: keyword)
                    try realm.write {
                        result.medium_ids.append(objectsIn: mediums.map { $0.id })
                        result.nextInfo = NextInfo(pageInfos: proccessingMediums.map { $0.pageInfo })
                    }
//                    viewItems = realm.filter(
//                        parentType: Medium.self,
//                        subclasses: [KakaoImage.self, NaverImage.self, KakaoVclip.self],
//                        predicate: NSPredicate(format: "id IN %@", result.medium_ids))
                    logger.debug("realm added query: [\(keyword)] pages: [\(pageInfos)] ids: [\(result.medium_ids.count)]")

                } catch let error {
                    logger.error("error: \(error)")
                    // ignored catched error
                }
                logger.debug("search items count: [\(viewItems.count)]")
                return viewItems
        }
    }
}
