//
//  MediumService.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxSwift

@objc enum DataSourceType: Int {
    case naverImage
    case kakaoImage
    case kakaoVClip
    case none
}
protocol MediumServiceType {
    func searchMedium(_ keyword: String, nexts: [NextInfo]) -> Single<[DataSourceType:MediumResponsable]>
}

class MediumService: MediumServiceType {
    private let kakaoService: KakaoDataSourceType
    private let naverService: NaverDataSourceType

    public init(kakaoService: KakaoDataSourceType, naverService: NaverDataSourceType) {
        self.kakaoService = kakaoService
        self.naverService = naverService
    }

    func searchMedium(_ keyword: String, nexts: [NextInfo]) -> Single<[DataSourceType:MediumResponsable]> {
        let pageSize = UserDefaults.standard.getPageSize()
        let aa = nexts.compactMap { next -> Single<MediumResponsable>? in
            switch next.dataSourceType {
            case DataSourceType.kakaoImage:
                return self.kakaoService.searchImages(KakaoMediumRequest(query: keyword, page: next.next, size: pageSize))
                    .map { $0 as MediumResponsable }
            case DataSourceType.kakaoVClip:
                return self.kakaoService.searchVclip(KakaoMediumRequest(query: keyword, page: next.next, size: pageSize))
                    .map { $0 as MediumResponsable }
            case DataSourceType.naverImage:
                return self.naverService.searchMedium(NaverMediumRequest(query: keyword, start: next.next, display: pageSize))
                    .map { $0 as MediumResponsable }
            case .none: return nil
            }
        }
        return Single.just([:])
//        return Single.zip(self.naverService.searchMedium(naverRequest), self.kakaoService.searchMedium(kakaoRequest)) { naver, kakao in
//            return [DataSourceType.naverImage: naver, DataSourceType.kakaoImage: kakao.0, DataSourceType.kakaoVClip: kakao.1]
//        }
    }
}
