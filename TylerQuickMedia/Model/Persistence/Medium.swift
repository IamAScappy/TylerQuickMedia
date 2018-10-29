//
//  Medium.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift

class Medium: Object {
    @objc dynamic var id: String = UUID().uuidString
    
    override static func primaryKey() -> String {
        return "id"
    }
}
