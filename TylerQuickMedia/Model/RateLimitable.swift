//
//  RateLimiter.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 23..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

protocol RateLimitable {
    var freshTime: Int { get }
    
    func shouldFetch(lastestDate: Date) -> Bool
}
