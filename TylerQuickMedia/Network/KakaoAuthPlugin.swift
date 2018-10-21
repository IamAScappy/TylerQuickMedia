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
}

public struct AccessTokenPlugin: PluginType {
    
    public let tokenClosure: () -> String
    
    /**
     Initialize a new `AccessTokenPlugin`.
     - parameters:
     - tokenClosure: A closure returning the token to be applied in the pattern `Authorization: <AuthorizationType> <token>`
     */
    public init(tokenClosure: @escaping @autoclosure () -> String) {
        self.tokenClosure = tokenClosure
    }
    
    /**
     Prepare a request by adding an authorization header if necessary.
     - parameters:
     - request: The request to modify.
     - target: The target of the request.
     - returns: The modified `URLRequest`.
     */
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard let authorizable = target as? AccessTokenAuthorizable else { return request }
        
        let authorizationType = authorizable.authorizationType
        
        var request = request
        
        switch authorizationType {
        case .kakaoAk:
            let value = "\(authorizationType.rawValue) \(self.tokenClosure())"
            request.addValue(value, forHTTPHeaderField: "Authorization")
        case .none:
            break
        }
        
        return request
    }
}
