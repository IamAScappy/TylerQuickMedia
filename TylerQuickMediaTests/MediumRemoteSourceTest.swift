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
import Then
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
        }
        func categoryTest(_ categoryType: SearchCategoryOptionType, test: () -> Void) {
            let searchResult = MediumSearchResult(query: "test", sortType: SearchSortType.recency, categoryType: categoryType)
            subject.searchMedium(searchResult: searchResult)
                .asObservable()
                .toBlocking(timeout: 0.1)
        }
        describe("Sort Test") {
            beforeEach {
                kakaoService.sortSample()
                naverService.sortSample()
            }
            it("Kakao Image [recency]", closure: {
                let searchResult = MediumSearchResult(query: "test", sortType: SearchSortType.recency, categoryType: .kakaoImage)
                let data = subject.searchMedium(searchResult: searchResult)
                    .asObservable()
                    .toBlocking(timeout: 0.1)
                let actualData = try! data.last()?.1.excludeObjectId()
                let expectData = kakaoService.sortRecencyImage.documents.excludeObjectId()
                expect(actualData?.first!.equalMedia(expectData.first!)) == true
                expect(actualData?.last!.equalMedia(expectData.last!)) == true
            })
            it("Naver Image [accuracy]", closure: {
                let searchResult = MediumSearchResult(query: "test", sortType: SearchSortType.accuracy, categoryType: .naver)
                let data = subject.searchMedium(searchResult: searchResult)
                    .asObservable()
                    .toBlocking(timeout: 0.1)
                let actualData = try! data.last()?.1.excludeObjectId()
                let expectData = naverService.sortDateImage.items.excludeObjectId()
                expect(actualData?.last!.equalMedia(expectData.last!)) == true
            })
        }
        describe("Category Test") {
            beforeEach {
                kakaoService.mockSample()
                naverService.mockSample()
            }
            it("[all]", closure: {
                categoryTest([.all], test: {
                    verify(naverService, times(1)).searchImages(any())
                    verify(kakaoService, times(1)).searchImages(any())
                    verify(kakaoService, times(1)).searchVclip(any())
                })
            })
            it("[kakako]", closure: {
                categoryTest([.kakao], test: {
                    verify(naverService, never()).searchImages(any())
                    verify(kakaoService, times(1)).searchImages(any())
                    verify(kakaoService, times(1)).searchVclip(any())
                })
            })
            it("[naver]", closure: {
                categoryTest([.naver], test: {
                    verify(naverService, times(1)).searchImages(any())
                    verify(kakaoService, never()).searchImages(any())
                    verify(kakaoService, never()).searchVclip(any())
                })
            })
            it("[kakakoImage naverImage]", closure: {
                categoryTest([.naver, .kakaoImage], test: {
                    verify(naverService, times(1)).searchImages(any())
                    verify(kakaoService, times(1)).searchImages(any())
                    verify(kakaoService, never()).searchVclip(any())
                })
            })
        }
    }
}
