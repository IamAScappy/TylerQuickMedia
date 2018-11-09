//
//  Object+.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 11. 1..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift

extension Realm {
    func filter<ParentType: Object>(parentType: ParentType.Type, subclasses: [ParentType.Type], predicate: NSPredicate) -> [ParentType] {
        return ([parentType] + subclasses).flatMap { classType in
            return self.objects(classType).filter(predicate)
        }
    }
}

extension Object {
    func save(update: Bool = true) {
        let realm = try? Realm()
        try? realm?.write {
            realm?.add(self, update: update)
        }
    }
}

extension Array where Element: Object {
    func save(update: Bool = true) {
        let realm = try? Realm()
        try? realm?.write {
            realm?.add(self, update: update)
        }
    }
}
