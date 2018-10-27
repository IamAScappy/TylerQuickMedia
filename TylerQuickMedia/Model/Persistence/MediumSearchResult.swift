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
    let nexts = List<NextInfo>()
    @objc dynamic var updatedTime: Date = Date()
    
    convenience init(query: String, nexts: [NextInfo], ids: [String]) {
        self.init()
        self.query = query
        self.nexts.append(objectsIn: nexts)
        self.medium_ids.append(objectsIn: ids)
    }
    
    override static func primaryKey() -> String {
        return "search_result_id"
    }
    override static func indexedProperties() -> [String] {
        return ["query"]
    }
}

//class NextInfo: Object {
//    @objc dynamic var kakaoNext: Int = 1
//    @objc dynamic var isKakaoEnd: Bool = false
//    @objc dynamic var naverNext: Int = 1
//    @objc dynamic var isNaverEnd: Bool = false
//
//    convenience init(kakaoNext: Int = 1, naverNext: Int = 1) {
//        self.init()
//        self.kakaoNext = kakaoNext
//        self.naverNext = naverNext
//    }
//}

class NextInfo: Object {
    @objc dynamic var dataSourceType: DataSourceType = .none
    @objc dynamic var next: Int = 1
    @objc dynamic var isEnd: Bool = false
}
