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

class NaverRemoteSource: NaverRemoteSourceType {
    private let provider: MoyaProvider<NaverApi>
    
    init(_ provider: MoyaProvider<NaverApi>) {
        self.provider = provider
    }
    func searchImages(_ param: NaverMediumRequest) -> Single<NaverImageResponse> {
        return self.provider.rx.request(.image(param))
            .do(onSuccess: { _ in
                logger.info("\(getThreadName())")
            })
            .network()
    }
}
