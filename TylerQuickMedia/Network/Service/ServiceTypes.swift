//
//  ServiceTypes.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxSwift

protocol KakaoServiceType {
    func searchMedium(_ param: KakaoMediumRequest) -> Single<[Medium]>
    func searchImages(_ param: KakaoMediumRequest) -> Single<KakaoImageResponse>
    func searchVclip(_ param: KakaoMediumRequest) -> Single<KakaoVclipResponse>
}

protocol NaverServiceType {
    func searchImages(_ param: NaverMediumRequest) -> Single<NaverImageResponse>
    func searchMedium(_ param: NaverMediumRequest) -> Single<[Medium]>
}
