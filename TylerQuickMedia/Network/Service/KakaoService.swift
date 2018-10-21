//
//  KakaoService.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import Moya
import Result
import RxSwift

class KakaoService: KakaoServiceType {
    func searchMedium(_ param: KakaoMediumRequest) -> Single<[Medium]> {
        return Single.zip(
            self.searchImages(param),
            self.searchVclip(param)) { (images, vclips) in
            var results: [Medium] = []
            results.append(contentsOf: images.documents)
            results.append(contentsOf: vclips.documents)
            return results
        }
    }

    private let provider: MoyaProvider<KakaoApi>

    init(_ provider: MoyaProvider<KakaoApi>) {
        self.provider = provider
    }

    func searchImages(_ param: KakaoMediumRequest) -> Single<KakaoImageResponse> {
        return self.provider.rx.request(.image(param))
            .network()
    }
    func searchVclip(_ param: KakaoMediumRequest) -> Single<KakaoVclipResponse> {
        return self.provider.rx.request(.vclip(param))
            .network()
    }
}
