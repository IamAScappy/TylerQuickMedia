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

enum KakaoApi {
    case image(KakaoMediumRequest)
    case vclip(KakaoMediumRequest)
}

extension KakaoApi: TargetType, AccessTokenAuthorizable {
    
    var baseURL: URL { return URL(string: Enviroment.Kakao.BASE_URL)! }

    var headers: [String: String]? {
        return ["Content-Type": "application/json;charset=UTF-8"]
    }

    var path: String {
        switch self {
        case .image:
            return "/v2/search/image"
        case .vclip:
            return "/v2/search/vclip"
        }
    }

    var authorizationType: AuthorizationType {
        switch self {
        case .image, .vclip:
            return .kakaoAk
        }
    }
    var method: Moya.Method {
        switch self {
        case .image, .vclip:
            return .get
        }
    }

    var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .image, .vclip:
            return URLEncoding.default
        default: return JSONEncoding.default
        }
    }
    var task: Task {
        switch self {
        case let .image(request):
            return .requestParameters(parameters: request.toDict(), encoding: parameterEncoding)
        case .vclip(let request):
            return .requestParameters(parameters: request.toDict(), encoding: parameterEncoding)
        }
    }

    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
}
