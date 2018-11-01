//
//  Result+toArray.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 27..
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
