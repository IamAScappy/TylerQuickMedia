//
//  MediumLocalSourceTYpe.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

protocol MediumLocalSourceType: RealmLocalSourceType {
    func getMedium(_ mediumIds: [String]) -> [Medium]
    func getSearchResult(_ keyword: String) -> MediumSearchResult?
//    func save<T: Object>(obj: T, update: Bool) -> T
//    func save<T: Object>(obj: [T], update: Bool)
}
