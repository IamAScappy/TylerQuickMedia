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
    static let kakaoVClip = SearchCategoryOptionType(rawValue: 2)
    static let naverImage = SearchCategoryOptionType(rawValue: 4)

    static let kakao: SearchCategoryOptionType = [.kakaoImage, .kakaoVClip]
    static let naver: SearchCategoryOptionType = [.naverImage]
    static let all: SearchCategoryOptionType = [.kakaoImage, .kakaoVClip, .naverImage]

}

extension SearchCategoryOptionType {
    func contains(_ member: DataSourceType) -> Bool {
        switch member {
        case .kakaoVClip: return contains(SearchCategoryOptionType.kakaoVClip)
        case .kakaoImage: return contains(SearchCategoryOptionType.kakaoImage)
        case .naverImage: return contains(SearchCategoryOptionType.naverImage)
        case .none: return false
        }
    }
}
@objc enum SearchSortType: Int {
    case accuracy
    case recency
}
