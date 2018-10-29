//
//  KakaoDataSourceType.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxSwift

protocol KakaoRemoteSourceType {
    func searchImages(_ param: KakaoMediumRequest) -> Single<KakaoImageResponse>
    func searchVclip(_ param: KakaoMediumRequest) -> Single<KakaoVClipResponse>
}
