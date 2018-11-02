//
//  KakaoRemoteSourceTest.swift
//  TylerQuickMediaTests
//
//  Created by tskim on 02/11/2018.
//  Copyright © 2018 tskim. All rights reserved.
//

import Foundation

import Nimble
import Quick
import Moya
@testable import TylerQuickMedia
class KakaoRemoteSourceTest: QuickSpec {
    override func spec() {
        let serverErrorEndpointClosure = { (target: KakaoApi) -> Endpoint in
            return Endpoint(url: URL(target: target).absoluteString,
                            sampleResponseClosure: { .networkResponse(400, ResourcesLoader.readData("kakao_reach_end_error")) },
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
        var subject: KakaoRemoteSourceType!
        beforeEach {
            let stubProvider = MoyaProvider<KakaoApi>(endpointClosure: serverErrorEndpointClosure, stubClosure: MoyaProvider.immediatelyStub)
            subject = KakaoRemoteSource(stubProvider)
        }
        describe("KakaoRemoteSourceTest") {
            it("카카오 throw InvalidArgument [isEnd = true]", closure: {
                let data = subject.searchImages(KakaoMediumRequest(query: "", page: 1, size: 2))
                    .toBlocking()

                expect(try! data.last()?.isEnd()) == true
            })
        }
    }
}

