//
//  AppDispatchQueue.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 30..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxSwift

class RxDispatchQueue {
    let io: SerialDispatchQueueScheduler
    init() {
        self.io = SerialDispatchQueueScheduler(internalSerialQueueName: "tyler-io-thread")
    }
}
