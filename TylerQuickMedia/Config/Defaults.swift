//
//  UserDefault+.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 25..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

enum DefaultKeys: String {
    case pageSize
}
extension UserDefaults {
    func defaultRegister() {
        self.register(defaults: [DefaultKeys.pageSize.rawValue: 10])
    }

    func setPageSize(pageSize: Int) { set(pageSize, forKey: DefaultKeys.pageSize.rawValue) }
    func getPageSize() -> Int { return integer(forKey: DefaultKeys.pageSize.rawValue) }
}
