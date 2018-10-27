//
//  ApplicationErrors.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 27..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

enum ApplicationErrors: Error, CustomDebugStringConvertible {
    case ignoreError
    
    public var debugDescription: String {
        switch self {
        case .ignoreError:
            return "ignore"
        }
    }
}
