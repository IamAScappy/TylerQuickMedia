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
//    let pageInfo: PageInfo
    let dataSourceType: DataSourceType
    let next: Int
    let isEnd: Bool
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
        logger.info("\(getThreadName())")
        let requests = pageInfos.compactMap { page -> Single<ProccessingMedium>? in
            logger.info("\(getThreadName())")
            guard let page = page else { return nil }
            let nextPage = page.next
            let dataSourceType = page.dataSourceType
            switch page.dataSourceType {
            case DataSourceType.kakaoImage:
                guard categoryOptions.contains(.kakaoImage) else { return nil }
                guard !page.isEnd else { return nil }
                return self.kakaoService.searchImages(KakaoMediumRequest(query: keyword, page: page.next, size: pageSize, sort: KakaoMediumRequest.mapSortType(sortOptions)))
                    .map { ProccessingMedium(dataSourceType: dataSourceType, next: nextPage.increase(isEnd: $0.isEnd()), isEnd: $0.isEnd(), items: $0.documents) }
            case DataSourceType.kakaoVClip:
                guard categoryOptions.contains(.kakaoVClip) else { return nil }
                guard !page.isEnd else { return nil }
                return self.kakaoService.searchVclip(
                    KakaoMediumRequest(query: keyword, page: page.next, size: pageSize, sort: KakaoMediumRequest.mapSortType(sortOptions)))
                    .map { ProccessingMedium(dataSourceType: dataSourceType, next: nextPage.increase(isEnd: $0.isEnd()), isEnd: $0.isEnd(), items: $0.documents) }
            case DataSourceType.naverImage:
                guard categoryOptions.contains(.naverImage) else { return nil }
                guard !page.isEnd else { return nil }
                return self.naverService.searchImages(
                    NaverMediumRequest(query: keyword, start: page.next, display: pageSize, sort: NaverMediumRequest.mapSortType(sortOptions)))
                    .map { ProccessingMedium(dataSourceType: dataSourceType, next: nextPage.increase(isEnd: $0.isEnd()), isEnd: $0.isEnd(), items: $0.items) }
            }
        }
        return Single.zip(requests)
            .do(onSuccess: { _ in
                logger.info("\(getThreadName())")
            })
            .map({ proccessingMediums in
                logger.info("\(getThreadName())")
                let pageInfos = proccessingMediums.map {
                    PageInfo(dataSourceType: $0.dataSourceType, next: $0.next, isEnd: $0.isEnd)
                }
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

private extension Int {
    func increase(isEnd: Bool) -> Int {
        return isEnd ? self : self + 1
    }
}
