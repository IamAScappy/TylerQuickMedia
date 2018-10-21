//
//  NaverRequests.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

struct NaverMediumRequest: DictionarySerializable {
    enum SortType: String {
        case sim
        case date
    }
    
    enum FilterType: String {
        case all
        case large
        case medium
        case small
    }
    
    let query: String
    let display: Int8
    let start: Int8 // max 1000
    let sort: String // sim or date
    let filter: String

    public init(query: String, start: Int8, display: Int8, filter: FilterType = .all, sort: SortType = .date) {
        self.query = query
        self.display = display
        self.start = start
        self.sort = sort.rawValue
        self.filter = filter.rawValue
    }
}
