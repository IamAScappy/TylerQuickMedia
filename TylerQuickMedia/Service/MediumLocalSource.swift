//
//  MediumLocalService.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift
import RxRealm
class MediumLocalSource: MediumLocalSourceType {
    func getSearchResult(_ keyword: String) -> MediumSearchResult? {
        let realm = try? Realm()
        return realm?.objects(MediumSearchResult.self).filter("query == %@", keyword).last
    }
    func getMedium(_ mediumIds: [String]) -> [Medium] {
        let realm = try? Realm()
        return realm?.filter(
            parentType: Medium.self,
            subclasses: [KakaoImage.self, NaverImage.self, KakaoVclip.self],
            predicate: NSPredicate(format: "id IN %@", mediumIds)) ?? []
    }
    
}
