//
//  SearchOptions.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 27..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

struct SearchCategoryOptionType: OptionSet {
    let rawValue: Int
    static let kakaoImage = SearchCategoryOptionType(rawValue: 1)
    static let  kakaoVClip = SearchCategoryOptionType(rawValue: 2)
    static let  naverImage = SearchCategoryOptionType(rawValue: 4)
    
    static let kakao: SearchCategoryOptionType = [.kakaoImage, .kakaoVClip]
    static let naver: SearchCategoryOptionType = [.naverImage]
    static let all: SearchCategoryOptionType = [.kakaoImage, .kakaoVClip, .naverImage]
    
}

@objc enum SearchSortType: Int {
    case accuracy
    case recency
}
extension SearchSortType {
    static var defaultType = recency
}
