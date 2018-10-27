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
    func searchMedium(_ keyword: String) -> Single<[Medium]>
}

class MediumRepository: MediumRepositoryType, RateLimitable {
    private let service: MediumServiceType
    private let realm = try? Realm()

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

    func searchMedium(_ keyword: String) -> Single<[Medium]> {
        guard !keyword.isEmpty else { return Single.just([]) }

        let nexts = realm?.objects(MediumSearchResult.self).filter("query = '\(keyword)'").last?.nexts
//
//        let aa = nexts?.flatMap({ nextInfo in
//            switch nextInfo.dataSourceType {
//            case DataSourceType.kakaoImage.rawValue: break
//            case DataSourceType.kakaoVClip.rawValue: break
//            case DataSourceType.naverImage.rawValue: break
//            default: break
//
//            }
//        })
//        self.service.searchMedium(keyword, next: nextInfo).map { responses -> Single<String> in
//            let aa = responses.flatMap({ (dataSourceType, response: MediumResponsable) in
//                var nextParams: [NextParameter] = []
//                switch dataSourceType {
//                case .kakaoImage: nextParams.append(NextParameter(next: nextInfo.kakaoNext.increase(), isEnd: response.isEnd()))
//                case .kakaoVClip: nextParams.append(NextParameter(next: nextInfo.kakaoNext.increase(), isEnd: response.isEnd()))
//                case .naverImage: nextParams.append(NextParameter(next: nextInfo.naverNext.increase(), isEnd: response.isEnd()))
//                }
//
//                MediumSearchResult(query: keyword, isEnd: response.isEnd(), next: <#T##NextInfo#>)
//                medium
//            })
//            responses[DataSourceType.kakaoImage]
//            return Single.just("")
//        }
//        return self.service.searchMedium(keyword, next: nextInfo)
        return Single.just([])
    }
}

extension Int {
    func increase() -> Int {
        return self + 1
    }
}
