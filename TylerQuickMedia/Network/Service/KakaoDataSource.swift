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
import RxMoya
import RxSwift

struct KakakoErrorData: Decodable {
    let errorType: String
    let message: String
}
public enum KakaoErrors: String, Swift.Error, CustomDebugStringConvertible {
    case hitEnd = "InvalidArgument"

    public var debugDescription: String {
        switch self {
        case .hitEnd:
            return "page is more than max"
        }
    }
}

protocol KakaoDataSourceType {
    func searchImages(_ param: KakaoMediumRequest) -> Single<KakaoResponse>
    func searchVclip(_ param: KakaoMediumRequest) -> Single<KakaoResponse>
}

class KakaoDataSource: KakaoDataSourceType {
//    func searchMedium(_ param: KakaoMediumRequest) -> Single<[Medium]> {
//        return Single.zip(
//            self.searchImages(param),
//            self.searchVclip(param)) { (images, vclips) in
//            var results: [Medium] = []
//            results.append(contentsOf: images.documents)
//            results.append(contentsOf: vclips.documents)
//            return results
//        }
//    }

    private let provider: MoyaProvider<KakaoApi>

    init(_ provider: MoyaProvider<KakaoApi>) {
        self.provider = provider
    }

    func searchImages(_ param: KakaoMediumRequest) -> Single<KakaoResponse> {
        return self.provider.rx.request(.image(param))
            .network()
            .catchHitEnd()
    }
    func searchVclip(_ param: KakaoMediumRequest) -> Single<KakaoResponse> {
        return self.provider.rx.request(.vclip(param))
            .network()
            .catchHitEnd()
    }
}

private extension PrimitiveSequence where TraitType == SingleTrait, ElementType == KakaoResponse {
    func catchHitEnd() -> PrimitiveSequence<SingleTrait, KakaoResponse> {
        return self.catchError({ error in
            if let moyaError = error as? MoyaError {
                let res = moyaError.response
                let errorData = try res?.map(KakakoErrorData.self)
                if res?.statusCode == 400 && errorData?.errorType == KakaoErrors.hitEnd.rawValue {
                    let meta = Meta.INSTANCE_END
                    return Single.just(KakaoResponse(meta: meta, documents: []))
                }
            }
            throw error
        })
    }
}
