//
//  KakaoService.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import Moya
import Result

enum NaverApi {
    case image(NaverMediumRequest)
}

extension NaverApi: TargetType, AccessTokenAuthorizable {
    
    var baseURL: URL { return URL(string: "https://openapi.naver.com")! }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json;charset=UTF-8"]
    }
    
    var path: String {
        switch self {
        case .image:
            return "/v1/search/image"
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .image:
            return .naver
        }
    }
    var method: Moya.Method {
        switch self {
        case .image:
            return .get
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .image:
            return URLEncoding.default
        }
    }
    var task: Task {
        switch self {
        case let .image(request):
            return .requestParameters(parameters: request.toDict(), encoding: parameterEncoding)
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
}
