//
//  MediumSearchResultTest.swift
//  TylerQuickMediaTests
//
//  Created by tskim on 2018. 11. 1..
//  Copyright © 2018년 tskim. All rights reserved.
//

import XCTest

import Nimble
import Quick
import RealmSwift
import Realm

@testable import TylerQuickMedia
class MediumSearchResultTest: RealmSpec {
    override func spec() {
        super.spec()
        let query = "test"
        describe("MediumSearchResult") {
            var a1: MediumSearchResult!
            var results: [MediumSearchResult]!
            beforeEach {
                a1 = MediumSearchResult(query: query, sortType: SearchSortType.defaultType)
                a1.save(update: true)
                results = MediumSearchResult.query(query)
            }
            it("조회 결과 일치", closure: {
                expect(results.count) == 1
                expect(results.last) == a1
            })
            it("Primary key 정책", closure: {
                expect(results.last?.id) == a1.makeIdString(query: a1.query, sortType: a1.sortType)
            })
        }
//        describe("같은 Query 같은 SortType") {
//            it("중복 체크", closure: {
//                do {
//                    try! realm.write {
//                        realm.add(a1, update: true)
//                        realm.add(a2)
//                    }
//                    fail()
//                } catch let e {
//                    succeed()
//                }
//            })
//        }
    }
}
