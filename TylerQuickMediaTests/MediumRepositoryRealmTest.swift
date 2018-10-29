//
//  MediumRepositoryRealmTest.swift
//  TylerQuickMediaTests
//
//  Created by tskim on 2018. 10. 27..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Nimble
import Quick
import RealmSwift
import Cuckoo
import RxSwift
import RxBlocking
@testable import TylerQuickMedia

class MediumRepositoryRealmTest: RealmSpec {
    override func spec() {
        var realm: Realm!
        var repository: MediumRepository!
        var service: MediumServiceType!
        var kakaoService: MockKakaoDataSourceType!
        var naverService: MockNaverDataSourceType!
        beforeEach {
            realm = try! Realm()
            try! realm.write {
                let searchResult = MediumSearchResult(query: "test", nexts: Array(MediumRepository.DEFAULT_NEXTINFO), ids: [])
                realm.add(searchResult)
            }
            kakaoService = MockKakaoDataSourceType()
            naverService = MockNaverDataSourceType()
            service = MediumService(kakaoService: kakaoService, naverService: naverService)
            repository = MediumRepository(service)
            kakaoService.mockSample()
            naverService.mockSample()
        }
        describe("MediumRepositoryRealm") {
            it("Basic call searchMedium", closure: {
                let result = repository.searchMedium("test")
                    .asObservable()
                    .take(0.1, scheduler: MainScheduler.instance)
                    .toBlocking()
                    .materialize()
                
                verify(kakaoService, times(1)).searchImages(any())
                verify(kakaoService, times(1)).searchVclip(any())
                verify(naverService, times(1)).searchImages(any())
                switch result {
                case .completed(let items):
//                    naverResponse.json + kakaoVclipResponse.json + kakaoImageResponse.json
                    expect(items.first?.count) == 49
                default: fail()
                }
            })
            it("Next of MediumSearchResult should be incremented ", closure: {
                _ = repository.searchMedium("test")
                    .asObservable()
                    .take(0.1, scheduler: MainScheduler.instance)
                    .toBlocking()
                    .materialize()
                
                let savedData = realm.objects(MediumSearchResult.self).last
                let next2Page = savedData?.nexts.allSatisfy({ nextInfo in
                    nextInfo.next == 2
                })
                
                expect(next2Page) == true
            })
        }
    }
}

