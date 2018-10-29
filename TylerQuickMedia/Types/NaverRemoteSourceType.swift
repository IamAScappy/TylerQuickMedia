//
//  NaverDataSourceType.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxSwift

protocol NaverRemoteSourceType {
    func searchImages(_ param: NaverMediumRequest) -> Single<NaverImageResponse>
}
