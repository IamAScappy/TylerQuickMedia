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
    @objc dynamic var query: String = ""
    let medium_ids = List<String>()
    @objc dynamic var nextInfo: NextInfo? = NextInfo()
    @objc dynamic var updatedTime: Date = Date()

    convenience init(query: String) {
        self.init()
        self.query = query
        self.nextInfo = NextInfo()
    }

    convenience init(query: String, nextInfo: NextInfo, ids: [String]) {
        self.init()
        self.query = query
        self.nextInfo = nextInfo
        self.medium_ids.append(objectsIn: ids)
    }

    override static func primaryKey() -> String {
        return "query"
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

class PageInfo: Object {
    @objc dynamic var dataSourceType: DataSourceType = .none
    @objc dynamic var next: Int = 1
    @objc dynamic var isEnd: Bool = false

    convenience init(dataSourceType: DataSourceType) {
        self.init()
        self.dataSourceType = dataSourceType
    }
    convenience init(dataSourceType: DataSourceType, next: Int, isEnd: Bool) {
        self.init()
        self.dataSourceType = dataSourceType
        self.next = next
        self.isEnd = isEnd
    }
}

class NextInfo: Object {
    @objc dynamic var kakaoImageNext: PageInfo? = PageInfo(dataSourceType: .kakaoImage)
    @objc dynamic var kakaoVClipNext: PageInfo? = PageInfo(dataSourceType: .kakaoVClip)
    @objc dynamic var naverImageNext: PageInfo? = PageInfo(dataSourceType: .naverImage)

    convenience init(pageInfos: [PageInfo]) {
        self.init()
        
        pageInfos.forEach { info in
            switch info.dataSourceType {
            case .naverImage:
                self.naverImageNext = info
            case .kakaoImage:
                self.kakaoImageNext = info
            case .kakaoVClip:
                self.kakaoVClipNext = info
            default: break
            }
        }
    }
}
