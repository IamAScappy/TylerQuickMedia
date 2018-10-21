import Foundation
import Moya
import Result

public protocol AccessTokenAuthorizable {
    
    var authorizationType: AuthorizationType { get }
}

public enum AuthorizationType: String {
    /// No header.
    case none
    
    case kakaoAk = "KakaoAK"
    case naver = "Naver"
}

public struct AccessTokenPlugin: PluginType {
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard let authorizable = target as? AccessTokenAuthorizable else { return request }
        
        let authorizationType = authorizable.authorizationType
        
        var request = request
        
        switch authorizationType {
        case .kakaoAk:
            let value = "\(authorizationType.rawValue) \(Enviroment.Kakao.API_KEY)"
            request.addValue(value, forHTTPHeaderField: "Authorization")
        case .none:
            break
        case .naver:
            request.addValue(Enviroment.Naver.CLIENT_ID, forHTTPHeaderField: "X-Naver-Client-Id")
            request.addValue(Enviroment.Naver.CLIENT_SECRET, forHTTPHeaderField: "X-Naver-Client-Secret")
        }
        
        return request
    }
}
