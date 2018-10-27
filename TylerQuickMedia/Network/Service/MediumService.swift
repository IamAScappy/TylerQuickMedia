//
//  MediumService.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxSwift

protocol MediumServiceType {
    func searchMedium(_ keyword: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType) -> Single<[ProccessingMedium]>
}

struct ProccessingMedium {
    let nextInfo: NextInfo
    let items: [Medium]
}

class MediumService: MediumServiceType {
    private let kakaoService: KakaoDataSourceType
    private let naverService: NaverDataSourceType

    public init(kakaoService: KakaoDataSourceType, naverService: NaverDataSourceType) {
        self.kakaoService = kakaoService
        self.naverService = naverService
    }

    func searchMedium(_ keyword: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType) -> Single<[ProccessingMedium]> {
        let pageSize = UserDefaults.standard.getPageSize()
        let requests = nexts.compactMap { next -> Single<ProccessingMedium>? in
            switch next.dataSourceType {
            case DataSourceType.kakaoImage:
                guard searchOptions.contains(.kakaoImage) else { return nil }
                return self.kakaoService.searchImages(
                    KakaoMediumRequest(query: keyword, page: next.next, size: pageSize, sort: KakaoMediumRequest.mapSortType(sortOptions)))
                .map { ProccessingMedium(nextInfo: next.newNextInfo(isEnd: $0.isEnd()), items: $0.documents) }
            case DataSourceType.kakaoVClip:
                guard searchOptions.contains(.kakaoVClip) else { return nil }
                return self.kakaoService.searchVclip(
                    KakaoMediumRequest(query: keyword, page: next.next, size: pageSize, sort: KakaoMediumRequest.mapSortType(sortOptions)))
                    .map { ProccessingMedium(nextInfo: next.newNextInfo(isEnd: $0.isEnd()), items: $0.documents) }
            case DataSourceType.naverImage:
                guard searchOptions.contains(.naverImage) else { return nil }
                return self.naverService.searchImages(
                    NaverMediumRequest(query: keyword, start: next.next, display: pageSize, sort: NaverMediumRequest.mapSortType(sortOptions)))
                    .map { ProccessingMedium(nextInfo: next.newNextInfo(isEnd: $0.isEnd()), items: $0.items) }
            case .none: return nil
            }
        }
        return Single.zip(requests)
    }
}

private extension KakaoMediumRequest {
    static func mapSortType(_ sortType: SearchSortType) -> SortType {
        switch sortType {
        case .accuracy: return SortType.accuracy
        case .recency: return SortType.recency
        }
    }
}

private extension NaverMediumRequest {
    static func mapSortType(_ sortType: SearchSortType) -> SortType {
        switch sortType {
        case .accuracy: return SortType.sim
        case .recency: return SortType.date
        }
    }
}

private extension NextInfo {
    func newNextInfo(isEnd: Bool) -> NextInfo {
        return NextInfo(dataSourceType: self.dataSourceType, next: isEnd ? next : next + 1, isEnd: isEnd)
    }
}
