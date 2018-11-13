# TylerQuickMedia


## Languages, libraries and tools used

* [Swift](https://developer.apple.com/kr/swift/)
* [RxSwift](https://github.com/ReactiveX/RxSwift)
* [RxJava2](https://github.com/ReactiveX/RxJava/wiki/What's-different-in-2.0)
* [SwiftLint](https://github.com/realm/SwiftLint)
* [SwiftGen](https://github.com/SwiftGen/SwiftGen)
* [SnapKit](https://github.com/SnapKit/SnapKit)
* [Storyboard](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html)
* [Moya](https://github.com/Moya/Moya)
* [Swinject](https://github.com/Swinject/Swinject)
* [Kingfisher](https://github.com/onevcat/Kingfisher)
* [Realm](https://realm.io/kr/docs/swift/latest/)
* [Hero](https://github.com/HeroTransitions/Hero)
* [SwiftyBeaver](https://github.com/SwiftyBeaver/SwiftyBeaver)
* [IGListKit](https://github.com/Instagram/IGListKit)
* [ReactorKit](https://github.com/ReactorKit/ReactorKit)
* [Then](https://github.com/devxoul/Then)
* [Firebase](https://firebase.google.com/docs/ios/setup?hl=ko)
* [Quick](https://github.com/Quick/Quick)
* [Nimble](https://github.com/Quick/Nimble)

## Realm with swift
### FlowChart 
![](document/flow-chart.png)
### DataModels
![](document/media.png)

### Codes
* [NaverImage.swift](TylerQuickMedia/Model/Persistence/NaverImage.swift) 
> [API 가이드](https://developers.naver.com/docs/search/image/)
* [KakaoImage.swift](TylerQuickMedia/Model/Persistence/KakaoImage.swift)
> [API 가이드](https://developers.kakao.com/docs/restapi/search#이미지-검색)
* [KakaoVclip.swift](TylerQuickMedia/Model/Persistence/KakaoVclip.swift) 
> [API 가이드](https://developers.kakao.com/docs/restapi/search#동영상-검색)

* [MediumSearchResult.swift](TylerQuickMedia/Model/Persistence/MediumSearchResult.swift)
* [NextInfo.swift](TylerQuickMedia/Model/Persistence/NextInfo.swift)

## Network
[Moya](https://github.com/Moya/Moya)를 활용한 API 구성
### [NaverApi](TylerQuickMedia/Network/Api/NaverApi.swift)
```swift
extension NaverApi: TargetType {
    var baseURL: URL { return URL(string: "https://openapi.naver.com")! }
    var path: String {
        switch self {
        case .image:
            return "/v1/search/image"
        }
    }
    var method: Moya.Method {
        switch self {
        case .image:
            return .get
        }
    }
}
```
### [KakaoApi](TylerQuickMedia/Network/Api/KakaoApi.swift)
```swift
extension KakaoApi: TargetType {
    var baseURL: URL { return URL(string: "https://dapi.kakao.com")! }
    var path: String {
        switch self {
        case .image:
            return "/v2/search/image"
        case .vclip:
            return "/v2/search/vclip"
        }
    }
    var method: Moya.Method {
        switch self {
        case .image, .vclip:
            return .get
        }
    }
}

```
### AccessToken
MoyaProvider를 생성하면서 Plugin을 등록해준다.
```swift
   let naverProvider = MoyaProvider<NaverApi>(
        callbackQueue: moyaSchduler,
        manager: DefaultAlamofireManager.sharedManager,
        plugins: moyaPlugins)
```
```swift
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
```
