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

@objc enum DataSourceType: Int {
    case naverImage
    case kakaoImage
    case kakaoVClip
    case none
}

class NextInfo: Object {
    @objc dynamic var dataSourceType: DataSourceType = .none
    @objc dynamic var next: Int = 1
    @objc dynamic var isEnd: Bool = false
    
    convenience init(dataSourceType: DataSourceType, next: Int, isEnd: Bool) {
        self.init()
        self.dataSourceType = dataSourceType
        self.next = next
        self.isEnd = isEnd
    }
}
extension NextInfo {
    class func generateInit(dataSourceType: DataSourceType) -> NextInfo {
        return NextInfo(dataSourceType: dataSourceType, next: 1, isEnd: false)
    }
}
