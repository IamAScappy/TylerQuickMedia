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
    func searchImages(_ param: KakaoMediumRequest) -> Single<KakaoImageResponse>
    func searchVclip(_ param: KakaoMediumRequest) -> Single<KakaoVclipResponse>
}
