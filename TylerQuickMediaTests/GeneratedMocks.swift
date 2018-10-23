// MARK: - Mocks generated from file: TylerQuickMedia/Network/Service/ServiceTypes.swift at 2018-10-23 12:18:37 +0000

//
//  ServiceTypes.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.

import Cuckoo
@testable import TylerQuickMedia

import Foundation
import RxSwift

class MockMediumServiceType: MediumServiceType, Cuckoo.ProtocolMock {
    typealias MocksType = MediumServiceType
    typealias Stubbing = __StubbingProxy_MediumServiceType
    typealias Verification = __VerificationProxy_MediumServiceType

    private var __defaultImplStub: MediumServiceType?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: MediumServiceType) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "searchMedium", "returnSignature": " -> Single<[Medium]>", "fullyQualifiedName": "searchMedium(naverRequest: NaverMediumRequest, kakaoRequest: KakaoMediumRequest) -> Single<[Medium]>", "parameterSignature": "naverRequest: NaverMediumRequest, kakaoRequest: KakaoMediumRequest", "parameterSignatureWithoutNames": "naverRequest: NaverMediumRequest, kakaoRequest: KakaoMediumRequest", "inputTypes": "NaverMediumRequest, KakaoMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "naverRequest, kakaoRequest", "call": "naverRequest: naverRequest, kakaoRequest: kakaoRequest", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("naverRequest"), name: "naverRequest", type: "NaverMediumRequest", range: CountableRange(230..<262), nameRange: CountableRange(230..<242)), CuckooGeneratorFramework.MethodParameter(label: Optional("kakaoRequest"), name: "kakaoRequest", type: "KakaoMediumRequest", range: CountableRange(264..<296), nameRange: CountableRange(264..<276))], "returnType": "Single<[Medium]>", "isOptional": false, "escapingParameterNames": "naverRequest, kakaoRequest", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchMedium(naverRequest: NaverMediumRequest, kakaoRequest: KakaoMediumRequest)  -> Single<[Medium]> {
        
            return cuckoo_manager.call("searchMedium(naverRequest: NaverMediumRequest, kakaoRequest: KakaoMediumRequest) -> Single<[Medium]>",
                parameters: (naverRequest, kakaoRequest),
                escapingParameters: (naverRequest, kakaoRequest),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.searchMedium(naverRequest: naverRequest, kakaoRequest: kakaoRequest))
        
    }
    

	struct __StubbingProxy_MediumServiceType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func searchMedium<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(naverRequest: M1, kakaoRequest: M2) -> Cuckoo.ProtocolStubFunction<(NaverMediumRequest, KakaoMediumRequest), Single<[Medium]>> where M1.MatchedType == NaverMediumRequest, M2.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(NaverMediumRequest, KakaoMediumRequest)>] = [wrap(matchable: naverRequest) { $0.0 }, wrap(matchable: kakaoRequest) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMediumServiceType.self, method: "searchMedium(naverRequest: NaverMediumRequest, kakaoRequest: KakaoMediumRequest) -> Single<[Medium]>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_MediumServiceType: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func searchMedium<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(naverRequest: M1, kakaoRequest: M2) -> Cuckoo.__DoNotUse<Single<[Medium]>> where M1.MatchedType == NaverMediumRequest, M2.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(NaverMediumRequest, KakaoMediumRequest)>] = [wrap(matchable: naverRequest) { $0.0 }, wrap(matchable: kakaoRequest) { $0.1 }]
	        return cuckoo_manager.verify("searchMedium(naverRequest: NaverMediumRequest, kakaoRequest: KakaoMediumRequest) -> Single<[Medium]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class MediumServiceTypeStub: MediumServiceType {
    

    

    
     func searchMedium(naverRequest: NaverMediumRequest, kakaoRequest: KakaoMediumRequest)  -> Single<[Medium]> {
        return DefaultValueRegistry.defaultValue(for: Single<[Medium]>.self)
    }
    
}


class MockKakaoServiceType: KakaoServiceType, Cuckoo.ProtocolMock {
    typealias MocksType = KakaoServiceType
    typealias Stubbing = __StubbingProxy_KakaoServiceType
    typealias Verification = __VerificationProxy_KakaoServiceType

    private var __defaultImplStub: KakaoServiceType?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: KakaoServiceType) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "searchMedium", "returnSignature": " -> Single<[Medium]>", "fullyQualifiedName": "searchMedium(_: KakaoMediumRequest) -> Single<[Medium]>", "parameterSignature": "_ param: KakaoMediumRequest", "parameterSignatureWithoutNames": "param: KakaoMediumRequest", "inputTypes": "KakaoMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "KakaoMediumRequest", range: CountableRange(371..<398), nameRange: CountableRange(0..<0))], "returnType": "Single<[Medium]>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchMedium(_ param: KakaoMediumRequest)  -> Single<[Medium]> {
        
            return cuckoo_manager.call("searchMedium(_: KakaoMediumRequest) -> Single<[Medium]>",
                parameters: (param),
                escapingParameters: (param),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.searchMedium(param))
        
    }
    
    // ["name": "searchImages", "returnSignature": " -> Single<KakaoImageResponse>", "fullyQualifiedName": "searchImages(_: KakaoMediumRequest) -> Single<KakaoImageResponse>", "parameterSignature": "_ param: KakaoMediumRequest", "parameterSignatureWithoutNames": "param: KakaoMediumRequest", "inputTypes": "KakaoMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "KakaoMediumRequest", range: CountableRange(442..<469), nameRange: CountableRange(0..<0))], "returnType": "Single<KakaoImageResponse>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchImages(_ param: KakaoMediumRequest)  -> Single<KakaoImageResponse> {
        
            return cuckoo_manager.call("searchImages(_: KakaoMediumRequest) -> Single<KakaoImageResponse>",
                parameters: (param),
                escapingParameters: (param),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.searchImages(param))
        
    }
    
    // ["name": "searchVclip", "returnSignature": " -> Single<KakaoVclipResponse>", "fullyQualifiedName": "searchVclip(_: KakaoMediumRequest) -> Single<KakaoVclipResponse>", "parameterSignature": "_ param: KakaoMediumRequest", "parameterSignatureWithoutNames": "param: KakaoMediumRequest", "inputTypes": "KakaoMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "KakaoMediumRequest", range: CountableRange(522..<549), nameRange: CountableRange(0..<0))], "returnType": "Single<KakaoVclipResponse>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchVclip(_ param: KakaoMediumRequest)  -> Single<KakaoVclipResponse> {
        
            return cuckoo_manager.call("searchVclip(_: KakaoMediumRequest) -> Single<KakaoVclipResponse>",
                parameters: (param),
                escapingParameters: (param),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.searchVclip(param))
        
    }
    

	struct __StubbingProxy_KakaoServiceType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func searchMedium<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ProtocolStubFunction<(KakaoMediumRequest), Single<[Medium]>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockKakaoServiceType.self, method: "searchMedium(_: KakaoMediumRequest) -> Single<[Medium]>", parameterMatchers: matchers))
	    }
	    
	    func searchImages<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ProtocolStubFunction<(KakaoMediumRequest), Single<KakaoImageResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockKakaoServiceType.self, method: "searchImages(_: KakaoMediumRequest) -> Single<KakaoImageResponse>", parameterMatchers: matchers))
	    }
	    
	    func searchVclip<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ProtocolStubFunction<(KakaoMediumRequest), Single<KakaoVclipResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockKakaoServiceType.self, method: "searchVclip(_: KakaoMediumRequest) -> Single<KakaoVclipResponse>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_KakaoServiceType: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func searchMedium<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.__DoNotUse<Single<[Medium]>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return cuckoo_manager.verify("searchMedium(_: KakaoMediumRequest) -> Single<[Medium]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func searchImages<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.__DoNotUse<Single<KakaoImageResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return cuckoo_manager.verify("searchImages(_: KakaoMediumRequest) -> Single<KakaoImageResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func searchVclip<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.__DoNotUse<Single<KakaoVclipResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return cuckoo_manager.verify("searchVclip(_: KakaoMediumRequest) -> Single<KakaoVclipResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class KakaoServiceTypeStub: KakaoServiceType {
    

    

    
     func searchMedium(_ param: KakaoMediumRequest)  -> Single<[Medium]> {
        return DefaultValueRegistry.defaultValue(for: Single<[Medium]>.self)
    }
    
     func searchImages(_ param: KakaoMediumRequest)  -> Single<KakaoImageResponse> {
        return DefaultValueRegistry.defaultValue(for: Single<KakaoImageResponse>.self)
    }
    
     func searchVclip(_ param: KakaoMediumRequest)  -> Single<KakaoVclipResponse> {
        return DefaultValueRegistry.defaultValue(for: Single<KakaoVclipResponse>.self)
    }
    
}


class MockNaverServiceType: NaverServiceType, Cuckoo.ProtocolMock {
    typealias MocksType = NaverServiceType
    typealias Stubbing = __StubbingProxy_NaverServiceType
    typealias Verification = __VerificationProxy_NaverServiceType

    private var __defaultImplStub: NaverServiceType?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: NaverServiceType) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "searchImages", "returnSignature": " -> Single<NaverImageResponse>", "fullyQualifiedName": "searchImages(_: NaverMediumRequest) -> Single<NaverImageResponse>", "parameterSignature": "_ param: NaverMediumRequest", "parameterSignatureWithoutNames": "param: NaverMediumRequest", "inputTypes": "NaverMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "NaverMediumRequest", range: CountableRange(634..<661), nameRange: CountableRange(0..<0))], "returnType": "Single<NaverImageResponse>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchImages(_ param: NaverMediumRequest)  -> Single<NaverImageResponse> {
        
            return cuckoo_manager.call("searchImages(_: NaverMediumRequest) -> Single<NaverImageResponse>",
                parameters: (param),
                escapingParameters: (param),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.searchImages(param))
        
    }
    
    // ["name": "searchMedium", "returnSignature": " -> Single<[Medium]>", "fullyQualifiedName": "searchMedium(_: NaverMediumRequest) -> Single<[Medium]>", "parameterSignature": "_ param: NaverMediumRequest", "parameterSignatureWithoutNames": "param: NaverMediumRequest", "inputTypes": "NaverMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "NaverMediumRequest", range: CountableRange(715..<742), nameRange: CountableRange(0..<0))], "returnType": "Single<[Medium]>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchMedium(_ param: NaverMediumRequest)  -> Single<[Medium]> {
        
            return cuckoo_manager.call("searchMedium(_: NaverMediumRequest) -> Single<[Medium]>",
                parameters: (param),
                escapingParameters: (param),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.searchMedium(param))
        
    }
    

	struct __StubbingProxy_NaverServiceType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func searchImages<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ProtocolStubFunction<(NaverMediumRequest), Single<NaverImageResponse>> where M1.MatchedType == NaverMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(NaverMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNaverServiceType.self, method: "searchImages(_: NaverMediumRequest) -> Single<NaverImageResponse>", parameterMatchers: matchers))
	    }
	    
	    func searchMedium<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ProtocolStubFunction<(NaverMediumRequest), Single<[Medium]>> where M1.MatchedType == NaverMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(NaverMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNaverServiceType.self, method: "searchMedium(_: NaverMediumRequest) -> Single<[Medium]>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_NaverServiceType: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func searchImages<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.__DoNotUse<Single<NaverImageResponse>> where M1.MatchedType == NaverMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(NaverMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return cuckoo_manager.verify("searchImages(_: NaverMediumRequest) -> Single<NaverImageResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func searchMedium<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.__DoNotUse<Single<[Medium]>> where M1.MatchedType == NaverMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(NaverMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return cuckoo_manager.verify("searchMedium(_: NaverMediumRequest) -> Single<[Medium]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class NaverServiceTypeStub: NaverServiceType {
    

    

    
     func searchImages(_ param: NaverMediumRequest)  -> Single<NaverImageResponse> {
        return DefaultValueRegistry.defaultValue(for: Single<NaverImageResponse>.self)
    }
    
     func searchMedium(_ param: NaverMediumRequest)  -> Single<[Medium]> {
        return DefaultValueRegistry.defaultValue(for: Single<[Medium]>.self)
    }
    
}

