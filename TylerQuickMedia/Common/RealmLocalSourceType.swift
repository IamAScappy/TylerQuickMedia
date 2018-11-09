//
//  RealmLocalSourceType.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 11. 1..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmLocalSourceType {
    func getObject<T: Object>(filter: NSPredicate) -> Results<T>?
    func save<T: Object>(obj: T, update: Bool) -> T
    func save<T: Object>(obj: [T], update: Bool)
}
extension RealmLocalSourceType {
    func getObject<T: Object>(filter: NSPredicate) -> Results<T>? {
        let realm = try? Realm()
        return realm?.objects(T.self).filter(filter)
    }
    func save<T: Object>(obj: T, update: Bool = true) -> T {
        let realm = try? Realm()
        try? realm?.write {
            realm?.add(obj, update: update)
        }
        return obj
    }
    func save<T: Object>(obj: [T], update: Bool) {
        let realm = try? Realm()
        try? realm?.write {
            realm?.add(obj, update: update)
        }
    }
}
