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
import RxSwift
import Moya
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
        describe("Next page Test") {
            beforeEach {
                kakaoService.pageSample()
                naverService.pageSample()
            }
            it("네트워크 요청 성공 [모두 Next 2]", closure: {
                let searchResult = MediumSearchResult(query: "test", sortType: SearchSortType.accuracy, categoryType: .all)
                let data = subject.searchMedium(searchResult: searchResult)
                    .asObservable()
                    .toBlocking(timeout: 0.1)
                expect(try! data.last()?.0.kakaoImageNext?.next) == 2
                expect(try! data.last()?.0.kakaoVClipNext?.next) == 2
                expect(try! data.last()?.0.naverImageNext?.next) == 2
            })
            it("카카오 네트워크 요청 성공 [카카오만 Next 2]", closure: {
                let searchResult = MediumSearchResult(query: "test", sortType: SearchSortType.accuracy, categoryType: .kakao)
                let data = subject.searchMedium(searchResult: searchResult)
                    .asObservable()
                    .toBlocking(timeout: 0.1)
                expect(try! data.last()?.0.kakaoImageNext?.next) == 2
                expect(try! data.last()?.0.kakaoVClipNext?.next) == 2
                expect(try! data.last()?.0.naverImageNext?.next) == 1
            })
            it("isEnd = true 인 경우 요청하지 않음", closure: {
                let searchResult = MediumSearchResult(query: "test", sortType: SearchSortType.accuracy, categoryType: .kakao)
                searchResult.nextInfo?.naverImageNext?.isEnd = true
                searchResult.nextInfo?.kakaoImageNext?.isEnd = true
                let data = subject.searchMedium(searchResult: searchResult)
                    .asObservable()
                    .toBlocking(timeout: 0.1)
                
                verify(kakaoService, never()).searchImages(any())
                verify(naverService, never()).searchImages(any())
                
                verify(kakaoService, times(1)).searchVclip(any())
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
