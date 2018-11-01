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
    associatedtype REQ
    associatedtype NEXTREQ
    associatedtype DATA

    func request(_ requestParam: REQ) -> PrimitiveSequence<SingleTrait, DATA>
    func nextPage(_ nextParam: NEXTREQ) -> PrimitiveSequence<SingleTrait, DATA>
//    func shouldFetch(_ req: REQ) -> Bool
//    func saveResult(data: DATA) throws
//    func loadFromLocal(_ req: REQ, mediumIds: [String]) -> DATA
//    func createRemoteCall(_ req: REQ) -> Single<DATA>
    }

