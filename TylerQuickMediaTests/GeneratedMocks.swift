// MARK: - Mocks generated from file: TylerQuickMedia/Network/Service/KakaoDataSource.swift at 2018-10-27 02:52:13 +0000

//
//  KakaoService.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.

import Cuckoo
@testable import TylerQuickMedia

import Foundation
import Moya
import Result
import RxMoya
import RxSwift

class MockKakaoDataSourceType: KakaoDataSourceType, Cuckoo.ProtocolMock {
    typealias MocksType = KakaoDataSourceType
    typealias Stubbing = __StubbingProxy_KakaoDataSourceType
    typealias Verification = __VerificationProxy_KakaoDataSourceType

    private var __defaultImplStub: KakaoDataSourceType?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: KakaoDataSourceType) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "searchImages", "returnSignature": " -> Single<KakaoImageResponse>", "fullyQualifiedName": "searchImages(_: KakaoMediumRequest) -> Single<KakaoImageResponse>", "parameterSignature": "_ param: KakaoMediumRequest", "parameterSignatureWithoutNames": "param: KakaoMediumRequest", "inputTypes": "KakaoMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "KakaoMediumRequest", range: CountableRange(272..<299), nameRange: CountableRange(0..<0))], "returnType": "Single<KakaoImageResponse>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchImages(_ param: KakaoMediumRequest)  -> Single<KakaoImageResponse> {
        
            return cuckoo_manager.call("searchImages(_: KakaoMediumRequest) -> Single<KakaoImageResponse>",
                parameters: (param),
                escapingParameters: (param),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.searchImages(param))
        
    }
    
    // ["name": "searchVclip", "returnSignature": " -> Single<KakaoVclipResponse>", "fullyQualifiedName": "searchVclip(_: KakaoMediumRequest) -> Single<KakaoVclipResponse>", "parameterSignature": "_ param: KakaoMediumRequest", "parameterSignatureWithoutNames": "param: KakaoMediumRequest", "inputTypes": "KakaoMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "KakaoMediumRequest", range: CountableRange(352..<379), nameRange: CountableRange(0..<0))], "returnType": "Single<KakaoVclipResponse>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchVclip(_ param: KakaoMediumRequest)  -> Single<KakaoVclipResponse> {
        
            return cuckoo_manager.call("searchVclip(_: KakaoMediumRequest) -> Single<KakaoVclipResponse>",
                parameters: (param),
                escapingParameters: (param),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.searchVclip(param))
        
    }
    

	struct __StubbingProxy_KakaoDataSourceType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func searchImages<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ProtocolStubFunction<(KakaoMediumRequest), Single<KakaoImageResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockKakaoDataSourceType.self, method: "searchImages(_: KakaoMediumRequest) -> Single<KakaoImageResponse>", parameterMatchers: matchers))
	    }
	    
	    func searchVclip<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ProtocolStubFunction<(KakaoMediumRequest), Single<KakaoVclipResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockKakaoDataSourceType.self, method: "searchVclip(_: KakaoMediumRequest) -> Single<KakaoVclipResponse>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_KakaoDataSourceType: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
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

 class KakaoDataSourceTypeStub: KakaoDataSourceType {
    

    

    
     func searchImages(_ param: KakaoMediumRequest)  -> Single<KakaoImageResponse> {
        return DefaultValueRegistry.defaultValue(for: Single<KakaoImageResponse>.self)
    }
    
     func searchVclip(_ param: KakaoMediumRequest)  -> Single<KakaoVclipResponse> {
        return DefaultValueRegistry.defaultValue(for: Single<KakaoVclipResponse>.self)
    }
    
}


class MockKakaoDataSource: KakaoDataSource, Cuckoo.ClassMock {
    typealias MocksType = KakaoDataSource
    typealias Stubbing = __StubbingProxy_KakaoDataSource
    typealias Verification = __VerificationProxy_KakaoDataSource

    private var __defaultImplStub: KakaoDataSource?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    func enableDefaultImplementation(_ stub: KakaoDataSource) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "searchImages", "returnSignature": " -> Single<KakaoImageResponse>", "fullyQualifiedName": "searchImages(_: KakaoMediumRequest) -> Single<KakaoImageResponse>", "parameterSignature": "_ param: KakaoMediumRequest", "parameterSignatureWithoutNames": "param: KakaoMediumRequest", "inputTypes": "KakaoMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "KakaoMediumRequest", range: CountableRange(1032..<1059), nameRange: CountableRange(0..<0))], "returnType": "Single<KakaoImageResponse>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ClassStubFunction"]
     override func searchImages(_ param: KakaoMediumRequest)  -> Single<KakaoImageResponse> {
        
            return cuckoo_manager.call("searchImages(_: KakaoMediumRequest) -> Single<KakaoImageResponse>",
                parameters: (param),
                escapingParameters: (param),
                superclassCall:
                    
                    super.searchImages(param)
                    ,
                defaultCall: __defaultImplStub!.searchImages(param))
        
    }
    
    // ["name": "searchVclip", "returnSignature": " -> Single<KakaoVclipResponse>", "fullyQualifiedName": "searchVclip(_: KakaoMediumRequest) -> Single<KakaoVclipResponse>", "parameterSignature": "_ param: KakaoMediumRequest", "parameterSignatureWithoutNames": "param: KakaoMediumRequest", "inputTypes": "KakaoMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "KakaoMediumRequest", range: CountableRange(1198..<1225), nameRange: CountableRange(0..<0))], "returnType": "Single<KakaoVclipResponse>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ClassStubFunction"]
     override func searchVclip(_ param: KakaoMediumRequest)  -> Single<KakaoVclipResponse> {
        
            return cuckoo_manager.call("searchVclip(_: KakaoMediumRequest) -> Single<KakaoVclipResponse>",
                parameters: (param),
                escapingParameters: (param),
                superclassCall:
                    
                    super.searchVclip(param)
                    ,
                defaultCall: __defaultImplStub!.searchVclip(param))
        
    }
    

	struct __StubbingProxy_KakaoDataSource: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func searchImages<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ClassStubFunction<(KakaoMediumRequest), Single<KakaoImageResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockKakaoDataSource.self, method: "searchImages(_: KakaoMediumRequest) -> Single<KakaoImageResponse>", parameterMatchers: matchers))
	    }
	    
	    func searchVclip<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ClassStubFunction<(KakaoMediumRequest), Single<KakaoVclipResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockKakaoDataSource.self, method: "searchVclip(_: KakaoMediumRequest) -> Single<KakaoVclipResponse>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_KakaoDataSource: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
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

 class KakaoDataSourceStub: KakaoDataSource {
    

    

    
     override func searchImages(_ param: KakaoMediumRequest)  -> Single<KakaoImageResponse> {
        return DefaultValueRegistry.defaultValue(for: Single<KakaoImageResponse>.self)
    }
    
     override func searchVclip(_ param: KakaoMediumRequest)  -> Single<KakaoVclipResponse> {
        return DefaultValueRegistry.defaultValue(for: Single<KakaoVclipResponse>.self)
    }
    
}


// MARK: - Mocks generated from file: TylerQuickMedia/Network/Service/MediumService.swift at 2018-10-27 02:52:13 +0000

//
//  MediumService.swift
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

    

    

    
    // ["name": "searchMedium", "returnSignature": " -> Single<[DataSourceType:MediumResponsable]>", "fullyQualifiedName": "searchMedium(_: String, nexts: [NextInfo]) -> Single<[DataSourceType:MediumResponsable]>", "parameterSignature": "_ keyword: String, nexts: [NextInfo]", "parameterSignatureWithoutNames": "keyword: String, nexts: [NextInfo]", "inputTypes": "String, [NextInfo]", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "keyword, nexts", "call": "keyword, nexts: nexts", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "keyword", type: "String", range: CountableRange(340..<357), nameRange: CountableRange(0..<0)), CuckooGeneratorFramework.MethodParameter(label: Optional("nexts"), name: "nexts", type: "[NextInfo]", range: CountableRange(359..<376), nameRange: CountableRange(359..<364))], "returnType": "Single<[DataSourceType:MediumResponsable]>", "isOptional": false, "escapingParameterNames": "keyword, nexts", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchMedium(_ keyword: String, nexts: [NextInfo])  -> Single<[DataSourceType:MediumResponsable]> {
        
            return cuckoo_manager.call("searchMedium(_: String, nexts: [NextInfo]) -> Single<[DataSourceType:MediumResponsable]>",
                parameters: (keyword, nexts),
                escapingParameters: (keyword, nexts),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.searchMedium(keyword, nexts: nexts))
        
    }
    

	struct __StubbingProxy_MediumServiceType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func searchMedium<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ keyword: M1, nexts: M2) -> Cuckoo.ProtocolStubFunction<(String, [NextInfo]), Single<[DataSourceType:MediumResponsable]>> where M1.MatchedType == String, M2.MatchedType == [NextInfo] {
	        let matchers: [Cuckoo.ParameterMatcher<(String, [NextInfo])>] = [wrap(matchable: keyword) { $0.0 }, wrap(matchable: nexts) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMediumServiceType.self, method: "searchMedium(_: String, nexts: [NextInfo]) -> Single<[DataSourceType:MediumResponsable]>", parameterMatchers: matchers))
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
	    func searchMedium<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ keyword: M1, nexts: M2) -> Cuckoo.__DoNotUse<Single<[DataSourceType:MediumResponsable]>> where M1.MatchedType == String, M2.MatchedType == [NextInfo] {
	        let matchers: [Cuckoo.ParameterMatcher<(String, [NextInfo])>] = [wrap(matchable: keyword) { $0.0 }, wrap(matchable: nexts) { $0.1 }]
	        return cuckoo_manager.verify("searchMedium(_: String, nexts: [NextInfo]) -> Single<[DataSourceType:MediumResponsable]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class MediumServiceTypeStub: MediumServiceType {
    

    

    
     func searchMedium(_ keyword: String, nexts: [NextInfo])  -> Single<[DataSourceType:MediumResponsable]> {
        return DefaultValueRegistry.defaultValue(for: Single<[DataSourceType:MediumResponsable]>.self)
    }
    
}


class MockMediumService: MediumService, Cuckoo.ClassMock {
    typealias MocksType = MediumService
    typealias Stubbing = __StubbingProxy_MediumService
    typealias Verification = __VerificationProxy_MediumService

    private var __defaultImplStub: MediumService?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    func enableDefaultImplementation(_ stub: MediumService) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "searchMedium", "returnSignature": " -> Single<[DataSourceType:MediumResponsable]>", "fullyQualifiedName": "searchMedium(_: String, nexts: [NextInfo]) -> Single<[DataSourceType:MediumResponsable]>", "parameterSignature": "_ keyword: String, nexts: [NextInfo]", "parameterSignatureWithoutNames": "keyword: String, nexts: [NextInfo]", "inputTypes": "String, [NextInfo]", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "keyword, nexts", "call": "keyword, nexts: nexts", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "keyword", type: "String", range: CountableRange(768..<785), nameRange: CountableRange(0..<0)), CuckooGeneratorFramework.MethodParameter(label: Optional("nexts"), name: "nexts", type: "[NextInfo]", range: CountableRange(787..<804), nameRange: CountableRange(787..<792))], "returnType": "Single<[DataSourceType:MediumResponsable]>", "isOptional": false, "escapingParameterNames": "keyword, nexts", "stubFunction": "Cuckoo.ClassStubFunction"]
     override func searchMedium(_ keyword: String, nexts: [NextInfo])  -> Single<[DataSourceType:MediumResponsable]> {
        
            return cuckoo_manager.call("searchMedium(_: String, nexts: [NextInfo]) -> Single<[DataSourceType:MediumResponsable]>",
                parameters: (keyword, nexts),
                escapingParameters: (keyword, nexts),
                superclassCall:
                    
                    super.searchMedium(keyword, nexts: nexts)
                    ,
                defaultCall: __defaultImplStub!.searchMedium(keyword, nexts: nexts))
        
    }
    

	struct __StubbingProxy_MediumService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func searchMedium<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ keyword: M1, nexts: M2) -> Cuckoo.ClassStubFunction<(String, [NextInfo]), Single<[DataSourceType:MediumResponsable]>> where M1.MatchedType == String, M2.MatchedType == [NextInfo] {
	        let matchers: [Cuckoo.ParameterMatcher<(String, [NextInfo])>] = [wrap(matchable: keyword) { $0.0 }, wrap(matchable: nexts) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMediumService.self, method: "searchMedium(_: String, nexts: [NextInfo]) -> Single<[DataSourceType:MediumResponsable]>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_MediumService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func searchMedium<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ keyword: M1, nexts: M2) -> Cuckoo.__DoNotUse<Single<[DataSourceType:MediumResponsable]>> where M1.MatchedType == String, M2.MatchedType == [NextInfo] {
	        let matchers: [Cuckoo.ParameterMatcher<(String, [NextInfo])>] = [wrap(matchable: keyword) { $0.0 }, wrap(matchable: nexts) { $0.1 }]
	        return cuckoo_manager.verify("searchMedium(_: String, nexts: [NextInfo]) -> Single<[DataSourceType:MediumResponsable]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class MediumServiceStub: MediumService {
    

    

    
     override func searchMedium(_ keyword: String, nexts: [NextInfo])  -> Single<[DataSourceType:MediumResponsable]> {
        return DefaultValueRegistry.defaultValue(for: Single<[DataSourceType:MediumResponsable]>.self)
    }
    
}


// MARK: - Mocks generated from file: TylerQuickMedia/Network/Service/NaverDataSource.swift at 2018-10-27 02:52:13 +0000

//
//  KakaoService.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.

import Cuckoo
@testable import TylerQuickMedia

import Foundation
import Moya
import Result
import RxSwift

class MockNaverDataSourceType: NaverDataSourceType, Cuckoo.ProtocolMock {
    typealias MocksType = NaverDataSourceType
    typealias Stubbing = __StubbingProxy_NaverDataSourceType
    typealias Verification = __VerificationProxy_NaverDataSourceType

    private var __defaultImplStub: NaverDataSourceType?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    func enableDefaultImplementation(_ stub: NaverDataSourceType) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "searchMedium", "returnSignature": " -> Single<NaverImageResponse>", "fullyQualifiedName": "searchMedium(_: NaverMediumRequest) -> Single<NaverImageResponse>", "parameterSignature": "_ param: NaverMediumRequest", "parameterSignatureWithoutNames": "param: NaverMediumRequest", "inputTypes": "NaverMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "NaverMediumRequest", range: CountableRange(258..<285), nameRange: CountableRange(0..<0))], "returnType": "Single<NaverImageResponse>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchMedium(_ param: NaverMediumRequest)  -> Single<NaverImageResponse> {
        
            return cuckoo_manager.call("searchMedium(_: NaverMediumRequest) -> Single<NaverImageResponse>",
                parameters: (param),
                escapingParameters: (param),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.searchMedium(param))
        
    }
    

	struct __StubbingProxy_NaverDataSourceType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func searchMedium<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ProtocolStubFunction<(NaverMediumRequest), Single<NaverImageResponse>> where M1.MatchedType == NaverMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(NaverMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNaverDataSourceType.self, method: "searchMedium(_: NaverMediumRequest) -> Single<NaverImageResponse>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_NaverDataSourceType: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func searchMedium<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.__DoNotUse<Single<NaverImageResponse>> where M1.MatchedType == NaverMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(NaverMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return cuckoo_manager.verify("searchMedium(_: NaverMediumRequest) -> Single<NaverImageResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class NaverDataSourceTypeStub: NaverDataSourceType {
    

    

    
     func searchMedium(_ param: NaverMediumRequest)  -> Single<NaverImageResponse> {
        return DefaultValueRegistry.defaultValue(for: Single<NaverImageResponse>.self)
    }
    
}


class MockNaverDataSource: NaverDataSource, Cuckoo.ClassMock {
    typealias MocksType = NaverDataSource
    typealias Stubbing = __StubbingProxy_NaverDataSource
    typealias Verification = __VerificationProxy_NaverDataSource

    private var __defaultImplStub: NaverDataSource?

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    func enableDefaultImplementation(_ stub: NaverDataSource) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    

    

    
    // ["name": "searchMedium", "returnSignature": " -> Single<NaverImageResponse>", "fullyQualifiedName": "searchMedium(_: NaverMediumRequest) -> Single<NaverImageResponse>", "parameterSignature": "_ param: NaverMediumRequest", "parameterSignatureWithoutNames": "param: NaverMediumRequest", "inputTypes": "NaverMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "NaverMediumRequest", range: CountableRange(702..<729), nameRange: CountableRange(0..<0))], "returnType": "Single<NaverImageResponse>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ClassStubFunction"]
     override func searchMedium(_ param: NaverMediumRequest)  -> Single<NaverImageResponse> {
        
            return cuckoo_manager.call("searchMedium(_: NaverMediumRequest) -> Single<NaverImageResponse>",
                parameters: (param),
                escapingParameters: (param),
                superclassCall:
                    
                    super.searchMedium(param)
                    ,
                defaultCall: __defaultImplStub!.searchMedium(param))
        
    }
    

	struct __StubbingProxy_NaverDataSource: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func searchMedium<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ClassStubFunction<(NaverMediumRequest), Single<NaverImageResponse>> where M1.MatchedType == NaverMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(NaverMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNaverDataSource.self, method: "searchMedium(_: NaverMediumRequest) -> Single<NaverImageResponse>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_NaverDataSource: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func searchMedium<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.__DoNotUse<Single<NaverImageResponse>> where M1.MatchedType == NaverMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(NaverMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return cuckoo_manager.verify("searchMedium(_: NaverMediumRequest) -> Single<NaverImageResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class NaverDataSourceStub: NaverDataSource {
    

    

    
     override func searchMedium(_ param: NaverMediumRequest)  -> Single<NaverImageResponse> {
        return DefaultValueRegistry.defaultValue(for: Single<NaverImageResponse>.self)
    }
    
}

