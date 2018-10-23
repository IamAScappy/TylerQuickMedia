//
//  MediumService.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxSwift

class MediumService: MediumServiceType {
    private let kakaoService: KakaoServiceType
    private let naverService: NaverServiceType

    public init(kakaoService: KakaoServiceType, naverService: NaverServiceType) {
        self.kakaoService = kakaoService
        self.naverService = naverService
    }
    func searchMedium(naverRequest: NaverMediumRequest, kakaoRequest: KakaoMediumRequest) -> Single<[Medium]> {
        return Single.zip(self.naverService.searchMedium(naverRequest), self.kakaoService.searchMedium(kakaoRequest)) { (naver, kakao) in
            var results: [Medium] = []
            results.append(contentsOf: naver)
            results.append(contentsOf: kakao)
            return results
        }
    }
}
