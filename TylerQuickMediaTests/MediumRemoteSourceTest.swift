//
//  MediumRemoteSourceTest.swift
//  TylerQuickMediaTests
//
//  Created by tskim on 2018. 11. 1..
//  Copyright © 2018년 tskim. All rights reserved.
//

import XCTest

import Nimble
import Quick
@testable import TylerQuickMedia
class MediumRemoteSourceTest: QuickSpec {
    override func spec() {
        super.spec()

        var subject: MediumRemoteSourceType!
        var remote: MockMediumRemoteSourceType!
        var kakaoService: MockKakaoRemoteSourceType!
        var naverService: MockNaverRemoteSourceType!
        beforeEach {
            kakaoService = MockKakaoRemoteSourceType()
            naverService = MockNaverRemoteSourceType()
            subject = MediumRemoteSource(kakaoService: kakaoService, naverService: naverService)
            kakaoService.mockSample()
            naverService.mockSample()
        }
        describe("MediumRemoteSource") {
            it("Category all", closure: {
                let searchResult = MediumSearchResult(query: "test", sortType: SearchSortType.recency)
                let request = RequestParam(keyword: "test", sortOptions: .recency, searchOptions: .all)
                subject.searchMedium(requestParam: request, searchResult: searchResult)
            })
        }
    }
}
