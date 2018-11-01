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
import RxBlocking
import Cuckoo
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
        func categoryTest(_ categoryType: SearchCategoryOptionType, test: () -> Void) {
            let searchResult = MediumSearchResult(query: "test", sortType: SearchSortType.recency, categoryType: categoryType)
            subject.searchMedium(searchResult: searchResult)
                .asObservable()
                .toBlocking(timeout: 0.1)
            test()
        }
        describe("MediumRemoteSource") {
            it("Category all", closure: {
                categoryTest([.all], test: {
                    verify(naverService, times(1)).searchImages(any())
                    verify(kakaoService, times(1)).searchImages(any())
                    verify(kakaoService, times(1)).searchVclip(any())
                })
            })
            it("Category kakako", closure: {
                categoryTest([.kakao], test: {
                    verify(naverService, never()).searchImages(any())
                    verify(kakaoService, times(1)).searchImages(any())
                    verify(kakaoService, times(1)).searchVclip(any())
                })
            })
            it("Category naver", closure: {
                categoryTest([.naver], test: {
                    verify(naverService, times(1)).searchImages(any())
                    verify(kakaoService, never()).searchImages(any())
                    verify(kakaoService, never()).searchVclip(any())
                })
            })
            it("Category kakakoImage naverImage", closure: {
                categoryTest([.naver, .kakaoImage], test: {
                    verify(naverService, times(1)).searchImages(any())
                    verify(kakaoService, times(1)).searchImages(any())
                    verify(kakaoService, never()).searchVclip(any())
                })
            })
        }
    }
}

