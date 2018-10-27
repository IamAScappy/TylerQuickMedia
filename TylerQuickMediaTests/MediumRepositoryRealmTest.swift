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
                realm.add(MediumSearchResult(query: "test", isEnd: false, next: NextInfo(kakaoNext: 1, naverNext: 2)))
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
                
                verify(kakaoService, times(1)).searchMedium(any())
                verify(naverService, times(1)).searchMedium(any())
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
                ///  preset: NextInfo(kakaoNext: 1, naverNext: 2)))
                expect(savedData?.next?.kakaoNext) == 2
                expect(savedData?.next?.naverNext) == 3
            })
        }
    }
}

