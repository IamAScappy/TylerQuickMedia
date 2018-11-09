//
//  NaverImageResponseTest.swift
//  
//
//  Created by tskim on 02/11/2018.
//

import XCTest

import Nimble
import Quick
@testable import TylerQuickMedia
class NaverImageResponseTest: QuickSpec {
    override func spec() {
        let items = MockNaverRemoteSourceType().sortSimImage.items
        describe("NaverImageResponseTest") {
            it("start range 1 ~ 1000 [isEnd = true]", closure: {
                var test = NaverImageResponse(display: 0, start: 1000, total: 10111, lastBuildDate: "", items: items)
                expect(test.isEnd()) == false
                
                test = NaverImageResponse(display: 0, start: 1001, total: 10111, lastBuildDate: "", items: items)
                expect(test.isEnd()) == true
            })
            it("start equal to total [isEnd = true]", closure: {
                var test = NaverImageResponse(display: 0, start: 5, total: 6, lastBuildDate: "", items: items)
                expect(test.isEnd()) == false
                
                test = NaverImageResponse(display: 0, start: 6, total: 6, lastBuildDate: "", items: items)
                expect(test.isEnd()) == true
            })
            it("items isEmpty [isEnd = true]", closure: {
                var test = NaverImageResponse(display: 0, start: 1, total: 6, lastBuildDate: "", items: items)
                expect(test.isEnd()) == false
                
                test = NaverImageResponse(display: 0, start: 1, total: 6, lastBuildDate: "", items: [])
                expect(test.isEnd()) == true
            })
        }
    }
}
