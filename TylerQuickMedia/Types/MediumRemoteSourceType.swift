//
//  MediumServiceType.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxSwift

protocol MediumRemoteSourceType {
    func searchMedium(_ keyword: String, nextInfo: NextInfo, sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType) -> Single<[ProccessingMedium]>
}
