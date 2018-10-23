//
//  SearchResult.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 23..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift

class MediumSearchResult: Object {
    @objc dynamic var search_result_id: String = UUID().uuidString
    @objc dynamic var query: String = ""
    let medium_ids = List<String>()
    @objc dynamic var isEnd: Bool = false
    @objc dynamic var next: Int = 1
    @objc dynamic var updatedTime: Date = Date()
    
    override static func primaryKey() -> String {
        return "search_result_id"
    }
    override static func indexedProperties() -> [String] {
        return ["query"]
    }
}

extension MediumSearchResult: RateLimitable {
    var freshTime: Int {
        return 20 * 1000 * 1000 // 20 minite
    }
    
    func shouldFetch() {
    }
}
