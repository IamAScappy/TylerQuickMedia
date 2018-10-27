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

protocol MediumRepositoryType {
    func searchMedium(_ keyword: String, searchOptions: SearchCategoryOptionType, sortOptions: SearchSortType) -> Single<[Medium]>
}
extension MediumRepositoryType {
    func searchMedium(
        _ keyword: String,
        searchOptions: SearchCategoryOptionType = SearchCategoryOptionType.all,
        sortOptions: SearchSortType = .recency) -> Single<[Medium]> {
        return searchMedium(keyword, searchOptions: searchOptions, sortOptions: sortOptions)
    }
}

class MediumRepository: MediumRepositoryType, RateLimitable {
    private let service: MediumServiceType

    init(_ service: MediumServiceType) {
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

    private func getNextInfo(_ keyword: String) throws -> [NextInfo]? {
        let realm = try Realm()
        let result = realm.objects(MediumSearchResult.self).filter("query = '\(keyword)'")
        if result.isEmpty {
            try realm.write {
                realm.add(MediumSearchResult(query: keyword, nexts: MediumRepository.DEFAULT_NEXTINFO, ids: []), update: true)
            }
        }
        let realmNexts = realm.objects(MediumSearchResult.self).filter("query = '\(keyword)'").last?.nexts
        
        return realmNexts?.map({ nextInfo  in
            // swiftlint:disable:next force_cast
            nextInfo.copy() as! NextInfo
        })
    }
    func searchMedium(
        _ keyword: String,
        searchOptions: SearchCategoryOptionType = SearchCategoryOptionType.all,
        sortOptions: SearchSortType = .recency) -> Single<[Medium]> {
        guard !keyword.isEmpty else { return Single.just([]) }

        var nextInfos: [NextInfo]? = []
        do {
            nextInfos = try getNextInfo(keyword)
        } catch let error {
            logger.error("error: \(error)")
        }
        guard let nexts = nextInfos else { return Single.just([]) }
        return self.service.searchMedium(keyword, nexts: nexts, sortOptions: sortOptions, searchOptions: searchOptions)
            .observeOn(SerialDispatchQueueScheduler(qos: .userInteractive))
            .map { proccessingMediums in
                let nextInfos = proccessingMediums.compactMap { $0.nextInfo }
                let mediums = proccessingMediums.flatMap({ $0.items })
                let ids = mediums.map { $0.id }
                do {
                    let realm = try Realm()
                    try realm.write {
                        realm.add(MediumSearchResult(query: keyword, nexts: nextInfos, ids: ids), update: true)
                        proccessingMediums.forEach { realm.add($0.items, update: true) }
                        logger.debug("realm added query: [\(keyword)] nexts: [\(nextInfos)] ids: [\(ids)]")
                    }
                } catch let error {
                    logger.error("error: \(error)")
                    // ignored catched error
                }
                return mediums
        }
    }
}

extension MediumRepository {
    static var DEFAULT_NEXTINFO: [NextInfo] {
        return [
            NextInfo.generateInit(dataSourceType: .kakaoImage),
            NextInfo.generateInit(dataSourceType: .kakaoVClip),
            NextInfo.generateInit(dataSourceType: .naverImage)
        ]
    }
}
