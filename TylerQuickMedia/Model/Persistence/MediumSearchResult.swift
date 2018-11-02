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
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var query: String = ""
    @objc dynamic var sortType: SearchSortType = .recency
    @objc dynamic var categoryType: Int = SearchCategoryOptionType.all.rawValue
    let medium_ids = List<String>()
    @objc dynamic var nextInfo: NextInfo? = NextInfo()
    @objc dynamic var updatedTime: Date = Date()

    convenience init(query: String, sortType: SearchSortType = .recency, categoryType: SearchCategoryOptionType = [.all]) {
        self.init()
        self.id = MediumSearchResult.makeIdString(query: query, sortType: sortType)
        self.categoryType = categoryType.rawValue
        self.query = query
    }

    override static func primaryKey() -> String {
        return "id"
    }
    override static func indexedProperties() -> [String] {
        return ["query"]
    }
}

extension MediumSearchResult {
    static func findSearchResultById(_ query: String, sortType: SearchSortType) -> MediumSearchResult? {
        let id = makeIdString(query: query, sortType: sortType)
        let realm = try? Realm()
        return realm?.objects(MediumSearchResult.self).filter("id == %@", id).last
    }
    static func makeIdString(query: String, sortType: SearchSortType) -> String {
        return "\(query)_\(sortType.rawValue)"
    }
}
