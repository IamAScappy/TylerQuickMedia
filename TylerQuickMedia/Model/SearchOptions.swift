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
    static let kakaoImage = SearchCategoryOptionType(rawValue: 0)
    static let  kakaoVClip = SearchCategoryOptionType(rawValue: 1)
    static let  naverImage = SearchCategoryOptionType(rawValue: 2)
    
    static let kakao: SearchCategoryOptionType = [.kakaoImage, .kakaoVClip]
    static let naver: SearchCategoryOptionType = [.naverImage]
    static let all: SearchCategoryOptionType = [.kakaoImage, .kakaoVClip, .naverImage]
}

enum SearchSortType: String {
    case accuracy
    case recency
}
