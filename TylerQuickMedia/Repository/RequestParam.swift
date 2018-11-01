//
//  RequestParam.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 11. 1..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

struct RequestParam {
    let keyword: String
    let sortOptions: SearchSortType
    let searchOptions: SearchCategoryOptionType
    
    public init(keyword: String, sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType) {
        self.keyword = keyword
        self.sortOptions = sortOptions
        self.searchOptions = searchOptions
    }
}
