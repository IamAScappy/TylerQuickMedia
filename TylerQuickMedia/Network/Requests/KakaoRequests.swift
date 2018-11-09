//
//  KakaoImageRequest.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//
struct KakaoMediumRequest: DictionarySerializable, Equatable {
    enum SortType: String {
        case accuracy
        case recency
    }

    let query: String
    let sort: String
    let page: Int
    let size: Int

    public init(query: String, page: Int, size: Int, sort: SortType = SortType.recency) {
        self.query = query
        self.sort = sort.rawValue
        self.page = page
        self.size = size
    }
}
