//
//  Enviroment.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import Moya
struct Enviroment {
    static let networkTimeout: TimeInterval = 3
    
    struct Kakao {
        static let BASE_URL = "https://dapi.kakao.com"
        static let API_KEY = "8c84f32197bb0fb2ccba0d7d73c57863"
    }
}
