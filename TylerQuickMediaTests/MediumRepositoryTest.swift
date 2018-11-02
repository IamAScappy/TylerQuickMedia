//
//  MediumRepositoryTest.swift
//  TylerQuickMediaTests
//
//  Created by tskim on 2018. 10. 24..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Nimble
import Quick
import RealmSwift
@testable import TylerQuickMedia

class MediumRepositoryTest: QuickSpec {
    override func spec() {
        var subject: MediumRepository!
        var remote: MediumRemoteSourceType!
        var kakaoService: MockKakaoRemoteSourceType!
        var naverService: MockNaverRemoteSourceType!
        beforeEach {
            kakaoService = MockKakaoRemoteSourceType()
            naverService = MockNaverRemoteSourceType()
            remote = MediumRemoteSource(kakaoService: kakaoService, naverService: naverService)
            subject = MediumRepository(remote: remote, scheduler: RxDispatchQueue())
            kakaoService.pageSample()
            naverService.pageSample()
        }
        func exceedFreshTime() -> Date {
            let freshTime = subject.freshTime
            return Date(timeIntervalSinceNow: TimeInterval(freshTime + 1))
        }
        describe("MediumRepositoryTest") {
            it("should fetch", closure: {
                let searchResult = MediumSearchResult(query: "test")
                searchResult.updatedTime = exceedFreshTime()
                expect(subject.shouldFetch(searchResult: searchResult)) == true
            })
        }
    }
//        var repository: MediumRepository!
//        var service: MediumServiceType!
//        var kakaoService: MockKakaoDataSourceType!
//        var naverService: MockNaverDataSourceType!
//        beforeEach {
//            kakaoService = MockKakaoDataSourceType()
//            naverService = MockNaverDataSourceType()
//            service = MediumService(kakaoService: kakaoService, naverService: naverService)
//            repository = MediumRepository(service)
//        }
//        describe("MediumRepository") {
//            beforeEach {
//                repository.mustFresh(false)
//            }
//            it("rate limit", closure: {
//                var pastDate = Date(timeIntervalSinceNow: TimeInterval(10))
//                expect(repository.shouldFetch(lastestDate: pastDate)) == false
//
//                pastDate = Date(timeIntervalSinceNow: TimeInterval(20 * 60 + 1))
//                expect(repository.shouldFetch(lastestDate: pastDate)) == true
//            })
//            it("rate limit must fresh true") {
//                repository.mustFresh(true)
//                let pastDate = Date(timeIntervalSinceNow: TimeInterval(0))
//                expect(repository.shouldFetch(lastestDate: pastDate)) == true
//            }
//        }
//    }
}

