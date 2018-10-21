//
//  KakaoImageRequest.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//
struct KakaoMediumRequest: DictionarySerializable {
    enum SortType: String {
        case accuracy
        case recency
    }

    let query: String
    let sort: String
    let page: UInt8
    let size: UInt8

    public init(query: String, page: UInt8, size: UInt8, sort: SortType = SortType.recency) {
        self.query = query
        self.sort = sort.rawValue
        self.page = page
        self.size = size
    }
}
