//
//  MediumService.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxSwift

struct ProccessingMedium {
    let pageInfo: PageInfo
    let items: [Medium]
}

class MediumRemoteSource: MediumRemoteSourceType {
    
    private let kakaoService: KakaoRemoteSourceType
    private let naverService: NaverRemoteSourceType

    public init(kakaoService: KakaoRemoteSourceType, naverService: NaverRemoteSourceType) {
        self.kakaoService = kakaoService
        self.naverService = naverService
    }

    func searchMedium(searchResult: MediumSearchResult) -> Single<(NextInfo, [Medium])> {
        let pageSize = UserDefaults.standard.getPageSize()
        let pageInfos = [searchResult.nextInfo?.kakaoImageNext, searchResult.nextInfo?.kakaoVClipNext, searchResult.nextInfo?.naverImageNext]
        let keyword = searchResult.query
        let categoryOptions = SearchCategoryOptionType(rawValue: searchResult.categoryType)
        let sortOptions = searchResult.sortType
        
        let requests = pageInfos.compactMap { page -> Single<ProccessingMedium>? in
            guard let page = page else { return nil }
            switch page.dataSourceType {
            case DataSourceType.kakaoImage:
                guard categoryOptions.contains(.kakaoImage) else { return nil }
                if page.isEnd { return Observable.empty().asSingle() }
                return self.kakaoService.searchImages(
                    KakaoMediumRequest(query: keyword, page: page.next, size: pageSize, sort: KakaoMediumRequest.mapSortType(sortOptions)))
                    .map { ProccessingMedium(pageInfo: page.increase(isEnd: $0.isEnd()), items: $0.documents) }
            case DataSourceType.kakaoVClip:
                if page.isEnd { return Observable.empty().asSingle() }
                guard categoryOptions.contains(.kakaoVClip) else { return nil }
                return self.kakaoService.searchVclip(
                    KakaoMediumRequest(query: keyword, page: page.next, size: pageSize, sort: KakaoMediumRequest.mapSortType(sortOptions)))
                    .map { ProccessingMedium(pageInfo: page.increase(isEnd: $0.isEnd()), items: $0.documents) }
            case DataSourceType.naverImage:
                if page.isEnd { return Observable.empty().asSingle() }
                guard categoryOptions.contains(.naverImage) else { return nil }
                return self.naverService.searchImages(
                    NaverMediumRequest(query: keyword, start: page.next, display: pageSize, sort: NaverMediumRequest.mapSortType(sortOptions)))
                    .map { ProccessingMedium(pageInfo: page.increase(isEnd: $0.isEnd()), items: $0.items) }
            case .none: return nil
            }
        }
        return Single.zip(requests)
            .map({ proccessingMediums in
                let pageInfos = proccessingMediums.map { $0.pageInfo }
                let mediums = proccessingMediums.flatMap({ $0.items })
                return (NextInfo(pageInfos: pageInfos), mediums)
            })
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
