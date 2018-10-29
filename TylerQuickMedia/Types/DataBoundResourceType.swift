//
//  SourceBoundResource.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift
import Result
import RxSwift

protocol DataBoundResourceType {
    associatedtype RESULT
    associatedtype DATA
    
    func saveResult(data: DATA) throws
    
    func shouldFetch(result: RESULT) -> Bool
    
    func loadFromLocal() -> DATA
    
    func createRemoteCall() -> Single<DATA>
}

