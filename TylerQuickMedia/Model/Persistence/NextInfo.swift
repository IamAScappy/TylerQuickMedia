//
//  NextInfo.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 11. 1..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift

@objc enum DataSourceType: Int {
    case naverImage
    case kakaoImage
    case kakaoVClip
}

class PageInfo: Object {
    @objc dynamic var dataSourceType: DataSourceType = .kakaoImage
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
