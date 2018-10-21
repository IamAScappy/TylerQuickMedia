//
//  Single+Network.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import Moya
import RxSwift

extension PrimitiveSequence where TraitType == SingleTrait, Element == Response {
    func network<T: Decodable>() -> Single<T> {
        return self.observeOn(SerialDispatchQueueScheduler(qos: .userInteractive))
            .filterSuccessfulStatusCodes()
            .map(T.self)
    }
}
