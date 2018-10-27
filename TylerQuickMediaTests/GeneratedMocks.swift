// MARK: - Mocks generated from file: TylerQuickMedia/Network/Service/KakaoDataSource.swift at 2018-10-27 06:10:26 +0000

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

    

    

    
    // ["name": "searchImages", "returnSignature": " -> Single<KakaoResponse>", "fullyQualifiedName": "searchImages(_: KakaoMediumRequest) -> Single<KakaoResponse>", "parameterSignature": "_ param: KakaoMediumRequest", "parameterSignatureWithoutNames": "param: KakaoMediumRequest", "inputTypes": "KakaoMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "KakaoMediumRequest", range: CountableRange(622..<649), nameRange: CountableRange(0..<0))], "returnType": "Single<KakaoResponse>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchImages(_ param: KakaoMediumRequest)  -> Single<KakaoResponse> {
        
            return cuckoo_manager.call("searchImages(_: KakaoMediumRequest) -> Single<KakaoResponse>",
                parameters: (param),
                escapingParameters: (param),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.searchImages(param))
        
    }
    
    // ["name": "searchVclip", "returnSignature": " -> Single<KakaoResponse>", "fullyQualifiedName": "searchVclip(_: KakaoMediumRequest) -> Single<KakaoResponse>", "parameterSignature": "_ param: KakaoMediumRequest", "parameterSignatureWithoutNames": "param: KakaoMediumRequest", "inputTypes": "KakaoMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "KakaoMediumRequest", range: CountableRange(697..<724), nameRange: CountableRange(0..<0))], "returnType": "Single<KakaoResponse>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchVclip(_ param: KakaoMediumRequest)  -> Single<KakaoResponse> {
        
            return cuckoo_manager.call("searchVclip(_: KakaoMediumRequest) -> Single<KakaoResponse>",
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
	    
	    
	    func searchImages<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ProtocolStubFunction<(KakaoMediumRequest), Single<KakaoResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockKakaoDataSourceType.self, method: "searchImages(_: KakaoMediumRequest) -> Single<KakaoResponse>", parameterMatchers: matchers))
	    }
	    
	    func searchVclip<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ProtocolStubFunction<(KakaoMediumRequest), Single<KakaoResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockKakaoDataSourceType.self, method: "searchVclip(_: KakaoMediumRequest) -> Single<KakaoResponse>", parameterMatchers: matchers))
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
	    func searchImages<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.__DoNotUse<Single<KakaoResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return cuckoo_manager.verify("searchImages(_: KakaoMediumRequest) -> Single<KakaoResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func searchVclip<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.__DoNotUse<Single<KakaoResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return cuckoo_manager.verify("searchVclip(_: KakaoMediumRequest) -> Single<KakaoResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class KakaoDataSourceTypeStub: KakaoDataSourceType {
    

    

    
     func searchImages(_ param: KakaoMediumRequest)  -> Single<KakaoResponse> {
        return DefaultValueRegistry.defaultValue(for: Single<KakaoResponse>.self)
    }
    
     func searchVclip(_ param: KakaoMediumRequest)  -> Single<KakaoResponse> {
        return DefaultValueRegistry.defaultValue(for: Single<KakaoResponse>.self)
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

    

    

    
    // ["name": "searchImages", "returnSignature": " -> Single<KakaoResponse>", "fullyQualifiedName": "searchImages(_: KakaoMediumRequest) -> Single<KakaoResponse>", "parameterSignature": "_ param: KakaoMediumRequest", "parameterSignatureWithoutNames": "param: KakaoMediumRequest", "inputTypes": "KakaoMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "KakaoMediumRequest", range: CountableRange(1372..<1399), nameRange: CountableRange(0..<0))], "returnType": "Single<KakaoResponse>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ClassStubFunction"]
     override func searchImages(_ param: KakaoMediumRequest)  -> Single<KakaoResponse> {
        
            return cuckoo_manager.call("searchImages(_: KakaoMediumRequest) -> Single<KakaoResponse>",
                parameters: (param),
                escapingParameters: (param),
                superclassCall:
                    
                    super.searchImages(param)
                    ,
                defaultCall: __defaultImplStub!.searchImages(param))
        
    }
    
    // ["name": "searchVclip", "returnSignature": " -> Single<KakaoResponse>", "fullyQualifiedName": "searchVclip(_: KakaoMediumRequest) -> Single<KakaoResponse>", "parameterSignature": "_ param: KakaoMediumRequest", "parameterSignatureWithoutNames": "param: KakaoMediumRequest", "inputTypes": "KakaoMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "KakaoMediumRequest", range: CountableRange(1560..<1587), nameRange: CountableRange(0..<0))], "returnType": "Single<KakaoResponse>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ClassStubFunction"]
     override func searchVclip(_ param: KakaoMediumRequest)  -> Single<KakaoResponse> {
        
            return cuckoo_manager.call("searchVclip(_: KakaoMediumRequest) -> Single<KakaoResponse>",
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
	    
	    
	    func searchImages<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ClassStubFunction<(KakaoMediumRequest), Single<KakaoResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockKakaoDataSource.self, method: "searchImages(_: KakaoMediumRequest) -> Single<KakaoResponse>", parameterMatchers: matchers))
	    }
	    
	    func searchVclip<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ClassStubFunction<(KakaoMediumRequest), Single<KakaoResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockKakaoDataSource.self, method: "searchVclip(_: KakaoMediumRequest) -> Single<KakaoResponse>", parameterMatchers: matchers))
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
	    func searchImages<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.__DoNotUse<Single<KakaoResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return cuckoo_manager.verify("searchImages(_: KakaoMediumRequest) -> Single<KakaoResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func searchVclip<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.__DoNotUse<Single<KakaoResponse>> where M1.MatchedType == KakaoMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(KakaoMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return cuckoo_manager.verify("searchVclip(_: KakaoMediumRequest) -> Single<KakaoResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class KakaoDataSourceStub: KakaoDataSource {
    

    

    
     override func searchImages(_ param: KakaoMediumRequest)  -> Single<KakaoResponse> {
        return DefaultValueRegistry.defaultValue(for: Single<KakaoResponse>.self)
    }
    
     override func searchVclip(_ param: KakaoMediumRequest)  -> Single<KakaoResponse> {
        return DefaultValueRegistry.defaultValue(for: Single<KakaoResponse>.self)
    }
    
}


// MARK: - Mocks generated from file: TylerQuickMedia/Network/Service/MediumService.swift at 2018-10-27 06:10:26 +0000

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

    

    

    
    // ["name": "searchMedium", "returnSignature": " -> Single<[Medium]>", "fullyQualifiedName": "searchMedium(_: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType) -> Single<[Medium]>", "parameterSignature": "_ keyword: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType", "parameterSignatureWithoutNames": "keyword: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType", "inputTypes": "String, [NextInfo], SearchSortType, SearchCategoryOptionType", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "keyword, nexts, sortOptions, searchOptions", "call": "keyword, nexts: nexts, sortOptions: sortOptions, searchOptions: searchOptions", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "keyword", type: "String", range: CountableRange(231..<248), nameRange: CountableRange(0..<0)), CuckooGeneratorFramework.MethodParameter(label: Optional("nexts"), name: "nexts", type: "[NextInfo]", range: CountableRange(250..<267), nameRange: CountableRange(250..<255)), CuckooGeneratorFramework.MethodParameter(label: Optional("sortOptions"), name: "sortOptions", type: "SearchSortType", range: CountableRange(269..<296), nameRange: CountableRange(269..<280)), CuckooGeneratorFramework.MethodParameter(label: Optional("searchOptions"), name: "searchOptions", type: "SearchCategoryOptionType", range: CountableRange(298..<337), nameRange: CountableRange(298..<311))], "returnType": "Single<[Medium]>", "isOptional": false, "escapingParameterNames": "keyword, nexts, sortOptions, searchOptions", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchMedium(_ keyword: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType)  -> Single<[Medium]> {
        
            return cuckoo_manager.call("searchMedium(_: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType) -> Single<[Medium]>",
                parameters: (keyword, nexts, sortOptions, searchOptions),
                escapingParameters: (keyword, nexts, sortOptions, searchOptions),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.searchMedium(keyword, nexts: nexts, sortOptions: sortOptions, searchOptions: searchOptions))
        
    }
    

	struct __StubbingProxy_MediumServiceType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func searchMedium<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(_ keyword: M1, nexts: M2, sortOptions: M3, searchOptions: M4) -> Cuckoo.ProtocolStubFunction<(String, [NextInfo], SearchSortType, SearchCategoryOptionType), Single<[Medium]>> where M1.MatchedType == String, M2.MatchedType == [NextInfo], M3.MatchedType == SearchSortType, M4.MatchedType == SearchCategoryOptionType {
	        let matchers: [Cuckoo.ParameterMatcher<(String, [NextInfo], SearchSortType, SearchCategoryOptionType)>] = [wrap(matchable: keyword) { $0.0 }, wrap(matchable: nexts) { $0.1 }, wrap(matchable: sortOptions) { $0.2 }, wrap(matchable: searchOptions) { $0.3 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMediumServiceType.self, method: "searchMedium(_: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType) -> Single<[Medium]>", parameterMatchers: matchers))
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
	    func searchMedium<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(_ keyword: M1, nexts: M2, sortOptions: M3, searchOptions: M4) -> Cuckoo.__DoNotUse<Single<[Medium]>> where M1.MatchedType == String, M2.MatchedType == [NextInfo], M3.MatchedType == SearchSortType, M4.MatchedType == SearchCategoryOptionType {
	        let matchers: [Cuckoo.ParameterMatcher<(String, [NextInfo], SearchSortType, SearchCategoryOptionType)>] = [wrap(matchable: keyword) { $0.0 }, wrap(matchable: nexts) { $0.1 }, wrap(matchable: sortOptions) { $0.2 }, wrap(matchable: searchOptions) { $0.3 }]
	        return cuckoo_manager.verify("searchMedium(_: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType) -> Single<[Medium]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class MediumServiceTypeStub: MediumServiceType {
    

    

    
     func searchMedium(_ keyword: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType)  -> Single<[Medium]> {
        return DefaultValueRegistry.defaultValue(for: Single<[Medium]>.self)
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

    

    

    
    // ["name": "searchMedium", "returnSignature": " -> Single<[Medium]>", "fullyQualifiedName": "searchMedium(_: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType) -> Single<[Medium]>", "parameterSignature": "_ keyword: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType", "parameterSignatureWithoutNames": "keyword: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType", "inputTypes": "String, [NextInfo], SearchSortType, SearchCategoryOptionType", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "keyword, nexts, sortOptions, searchOptions", "call": "keyword, nexts: nexts, sortOptions: sortOptions, searchOptions: searchOptions", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "keyword", type: "String", range: CountableRange(703..<720), nameRange: CountableRange(0..<0)), CuckooGeneratorFramework.MethodParameter(label: Optional("nexts"), name: "nexts", type: "[NextInfo]", range: CountableRange(722..<739), nameRange: CountableRange(722..<727)), CuckooGeneratorFramework.MethodParameter(label: Optional("sortOptions"), name: "sortOptions", type: "SearchSortType", range: CountableRange(741..<768), nameRange: CountableRange(741..<752)), CuckooGeneratorFramework.MethodParameter(label: Optional("searchOptions"), name: "searchOptions", type: "SearchCategoryOptionType", range: CountableRange(770..<809), nameRange: CountableRange(770..<783))], "returnType": "Single<[Medium]>", "isOptional": false, "escapingParameterNames": "keyword, nexts, sortOptions, searchOptions", "stubFunction": "Cuckoo.ClassStubFunction"]
     override func searchMedium(_ keyword: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType)  -> Single<[Medium]> {
        
            return cuckoo_manager.call("searchMedium(_: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType) -> Single<[Medium]>",
                parameters: (keyword, nexts, sortOptions, searchOptions),
                escapingParameters: (keyword, nexts, sortOptions, searchOptions),
                superclassCall:
                    
                    super.searchMedium(keyword, nexts: nexts, sortOptions: sortOptions, searchOptions: searchOptions)
                    ,
                defaultCall: __defaultImplStub!.searchMedium(keyword, nexts: nexts, sortOptions: sortOptions, searchOptions: searchOptions))
        
    }
    

	struct __StubbingProxy_MediumService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func searchMedium<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(_ keyword: M1, nexts: M2, sortOptions: M3, searchOptions: M4) -> Cuckoo.ClassStubFunction<(String, [NextInfo], SearchSortType, SearchCategoryOptionType), Single<[Medium]>> where M1.MatchedType == String, M2.MatchedType == [NextInfo], M3.MatchedType == SearchSortType, M4.MatchedType == SearchCategoryOptionType {
	        let matchers: [Cuckoo.ParameterMatcher<(String, [NextInfo], SearchSortType, SearchCategoryOptionType)>] = [wrap(matchable: keyword) { $0.0 }, wrap(matchable: nexts) { $0.1 }, wrap(matchable: sortOptions) { $0.2 }, wrap(matchable: searchOptions) { $0.3 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMediumService.self, method: "searchMedium(_: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType) -> Single<[Medium]>", parameterMatchers: matchers))
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
	    func searchMedium<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(_ keyword: M1, nexts: M2, sortOptions: M3, searchOptions: M4) -> Cuckoo.__DoNotUse<Single<[Medium]>> where M1.MatchedType == String, M2.MatchedType == [NextInfo], M3.MatchedType == SearchSortType, M4.MatchedType == SearchCategoryOptionType {
	        let matchers: [Cuckoo.ParameterMatcher<(String, [NextInfo], SearchSortType, SearchCategoryOptionType)>] = [wrap(matchable: keyword) { $0.0 }, wrap(matchable: nexts) { $0.1 }, wrap(matchable: sortOptions) { $0.2 }, wrap(matchable: searchOptions) { $0.3 }]
	        return cuckoo_manager.verify("searchMedium(_: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType) -> Single<[Medium]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class MediumServiceStub: MediumService {
    

    

    
     override func searchMedium(_ keyword: String, nexts: [NextInfo], sortOptions: SearchSortType, searchOptions: SearchCategoryOptionType)  -> Single<[Medium]> {
        return DefaultValueRegistry.defaultValue(for: Single<[Medium]>.self)
    }
    
}


// MARK: - Mocks generated from file: TylerQuickMedia/Network/Service/NaverDataSource.swift at 2018-10-27 06:10:26 +0000

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

    

    

    
    // ["name": "searchImages", "returnSignature": " -> Single<NaverImageResponse>", "fullyQualifiedName": "searchImages(_: NaverMediumRequest) -> Single<NaverImageResponse>", "parameterSignature": "_ param: NaverMediumRequest", "parameterSignatureWithoutNames": "param: NaverMediumRequest", "inputTypes": "NaverMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "NaverMediumRequest", range: CountableRange(258..<285), nameRange: CountableRange(0..<0))], "returnType": "Single<NaverImageResponse>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchImages(_ param: NaverMediumRequest)  -> Single<NaverImageResponse> {
        
            return cuckoo_manager.call("searchImages(_: NaverMediumRequest) -> Single<NaverImageResponse>",
                parameters: (param),
                escapingParameters: (param),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.searchImages(param))
        
    }
    

	struct __StubbingProxy_NaverDataSourceType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func searchImages<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ProtocolStubFunction<(NaverMediumRequest), Single<NaverImageResponse>> where M1.MatchedType == NaverMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(NaverMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNaverDataSourceType.self, method: "searchImages(_: NaverMediumRequest) -> Single<NaverImageResponse>", parameterMatchers: matchers))
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
	    func searchImages<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.__DoNotUse<Single<NaverImageResponse>> where M1.MatchedType == NaverMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(NaverMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return cuckoo_manager.verify("searchImages(_: NaverMediumRequest) -> Single<NaverImageResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class NaverDataSourceTypeStub: NaverDataSourceType {
    

    

    
     func searchImages(_ param: NaverMediumRequest)  -> Single<NaverImageResponse> {
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

    

    

    
    // ["name": "searchImages", "returnSignature": " -> Single<NaverImageResponse>", "fullyQualifiedName": "searchImages(_: NaverMediumRequest) -> Single<NaverImageResponse>", "parameterSignature": "_ param: NaverMediumRequest", "parameterSignatureWithoutNames": "param: NaverMediumRequest", "inputTypes": "NaverMediumRequest", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "param", "call": "param", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "param", type: "NaverMediumRequest", range: CountableRange(527..<554), nameRange: CountableRange(0..<0))], "returnType": "Single<NaverImageResponse>", "isOptional": false, "escapingParameterNames": "param", "stubFunction": "Cuckoo.ClassStubFunction"]
     override func searchImages(_ param: NaverMediumRequest)  -> Single<NaverImageResponse> {
        
            return cuckoo_manager.call("searchImages(_: NaverMediumRequest) -> Single<NaverImageResponse>",
                parameters: (param),
                escapingParameters: (param),
                superclassCall:
                    
                    super.searchImages(param)
                    ,
                defaultCall: __defaultImplStub!.searchImages(param))
        
    }
    

	struct __StubbingProxy_NaverDataSource: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func searchImages<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.ClassStubFunction<(NaverMediumRequest), Single<NaverImageResponse>> where M1.MatchedType == NaverMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(NaverMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNaverDataSource.self, method: "searchImages(_: NaverMediumRequest) -> Single<NaverImageResponse>", parameterMatchers: matchers))
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
	    func searchImages<M1: Cuckoo.Matchable>(_ param: M1) -> Cuckoo.__DoNotUse<Single<NaverImageResponse>> where M1.MatchedType == NaverMediumRequest {
	        let matchers: [Cuckoo.ParameterMatcher<(NaverMediumRequest)>] = [wrap(matchable: param) { $0 }]
	        return cuckoo_manager.verify("searchImages(_: NaverMediumRequest) -> Single<NaverImageResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class NaverDataSourceStub: NaverDataSource {
    

    

    
     override func searchImages(_ param: NaverMediumRequest)  -> Single<NaverImageResponse> {
        return DefaultValueRegistry.defaultValue(for: Single<NaverImageResponse>.self)
    }
    
}

