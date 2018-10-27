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

protocol NaverDataSourceType {
    func searchMedium(_ param: NaverMediumRequest) -> Single<NaverImageResponse>
}

class NaverDataSource: NaverDataSourceType {
    private let provider: MoyaProvider<NaverApi>
    
    init(_ provider: MoyaProvider<NaverApi>) {
        self.provider = provider
    }
    private func searchImages(_ param: NaverMediumRequest) -> Single<NaverImageResponse> {
        return self.provider.rx.request(.image(param))
            .network()
    }
    func searchMedium(_ param: NaverMediumRequest) -> Single<NaverImageResponse> {
        return self.searchImages(param).map { $0 }
    }
}
