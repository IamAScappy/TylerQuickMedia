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
    func searchImages(_ param: KakaoMediumRequest) -> Single<KakaoImageResponse>
    func searchVclip(_ param: KakaoMediumRequest) -> Single<KakaoVClipResponse>
}

class KakaoDataSource: KakaoDataSourceType {
    private let provider: MoyaProvider<KakaoApi>

    init(_ provider: MoyaProvider<KakaoApi>) {
        self.provider = provider
    }

    func searchImages(_ param: KakaoMediumRequest) -> Single<KakaoImageResponse> {
        return self.provider.rx.request(.image(param))
            .network()
            .catchHitEnd({
                Single.just(KakaoImageResponse(meta: Meta.INSTANCE_END, documents: []))
            })
    }
    
    func searchVclip(_ param: KakaoMediumRequest) -> Single<KakaoVClipResponse> {
        return self.provider.rx.request(.vclip(param))
            .network()
            .catchHitEnd({
                Single.just(KakaoVClipResponse(meta: Meta.INSTANCE_END, documents: []))
            })

    }
}

private extension PrimitiveSequence where TraitType == SingleTrait {
    func catchHitEnd(_ concreateType: @escaping () -> PrimitiveSequence<SingleTrait, Element>) -> PrimitiveSequence<SingleTrait, Element> {
        return self.catchError({ error in
            if let moyaError = error as? MoyaError {
                let res = moyaError.response
                let errorData = try res?.map(KakakoErrorData.self)
                if res?.statusCode == 400 && errorData?.errorType == KakaoErrors.hitEnd.rawValue {
                    return concreateType()
                }
            }
            throw error
        })
    }
}
