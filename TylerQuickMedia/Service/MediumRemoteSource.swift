//
//  MediumService.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxSwift

class MediumRemoteSource: MediumRemoteSourceType {
    private let kakaoService: KakaoRemoteSourceType
    private let naverService: NaverRemoteSourceType

    public init(kakaoService: KakaoRemoteSourceType, naverService: NaverRemoteSourceType) {
        self.kakaoService = kakaoService
        self.naverService = naverService
    }

    func searchMedium(_ keyword: String, nextInfo: NextInfo, sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType) -> Single<[ProccessingMedium]> {
        let pageSize = UserDefaults.standard.getPageSize()
        let pageInfos = [nextInfo.kakaoImageNext, nextInfo.kakaoVClipNext, nextInfo.naverImageNext]
        let requests = pageInfos.compactMap { page -> Single<ProccessingMedium>? in
            guard let page = page else { return nil }
            switch page.dataSourceType {
            case DataSourceType.kakaoImage:
                guard searchOptions.contains(.kakaoImage) else { return nil }
                return self.kakaoService.searchImages(
                    KakaoMediumRequest(query: keyword, page: page.next, size: pageSize, sort: KakaoMediumRequest.mapSortType(sortOptions)))
                    .map { ProccessingMedium(pageInfo: page.increase(isEnd: $0.isEnd()), items: $0.documents) }
            case DataSourceType.kakaoVClip:
                guard searchOptions.contains(.kakaoVClip) else { return nil }
                return self.kakaoService.searchVclip(
                    KakaoMediumRequest(query: keyword, page: page.next, size: pageSize, sort: KakaoMediumRequest.mapSortType(sortOptions)))
                    .map { ProccessingMedium(pageInfo: page.increase(isEnd: $0.isEnd()), items: $0.documents) }
            case DataSourceType.naverImage:
                guard searchOptions.contains(.naverImage) else { return nil }
                return self.naverService.searchImages(
                    NaverMediumRequest(query: keyword, start: page.next, display: pageSize, sort: NaverMediumRequest.mapSortType(sortOptions)))
                    .map { ProccessingMedium(pageInfo: page.increase(isEnd: $0.isEnd()), items: $0.items) }
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

private extension PageInfo {
    func increase(isEnd: Bool) -> PageInfo {
        return PageInfo(dataSourceType: self.dataSourceType, next: isEnd ? next : next + 1, isEnd: isEnd)
    }
}
