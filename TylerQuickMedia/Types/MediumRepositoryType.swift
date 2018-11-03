//
//  MediumRepositoryType.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxSwift

protocol MediumRepositoryType {
    func searchMedium(_ keyword: String, searchOptions: SearchCategoryOptionType, sortOptions: SearchSortType) -> Single<[Medium]>
    func nextMedium(_ keyword: String, searchOptions: SearchCategoryOptionType, sortOptions: SearchSortType) -> Single<[Medium]>
}
extension MediumRepositoryType {
    func nextMedium(
        _ keyword: String,
        searchOptions: SearchCategoryOptionType = SearchCategoryOptionType.all,
        sortOptions: SearchSortType = .recency) -> Single<[Medium]> {
        return nextMedium(keyword, searchOptions: searchOptions, sortOptions: sortOptions)
    }
    func searchMedium(
        _ keyword: String,
        searchOptions: SearchCategoryOptionType = SearchCategoryOptionType.all,
        sortOptions: SearchSortType = .recency) -> Single<[Medium]> {
        return searchMedium(keyword, searchOptions: searchOptions, sortOptions: sortOptions)
    }
}
