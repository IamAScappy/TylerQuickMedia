//
//  ISO8601DateFommater.swift
//  TylerQuickMediaTests
//
//  Created by tskim on 02/11/2018.
//  Copyright © 2018 tskim. All rights reserved.
//

import XCTest

import Nimble
import Quick
@testable import TylerQuickMedia
class ISO8601DateFommaterTest: QuickSpec {
    override func spec() {
        describe("ISO8601DateFommaterTest") {
            it("", closure: {
                let testDateString = "2018-10-10T03:00:01.000+09:00"
                let expectDate = DateFormatter.iso8601Format(testDateString)!
                let calendar = Calendar.current
                expect(calendar.component(.year, from: expectDate)) == 2018
                expect(calendar.component(.month, from: expectDate)) == 10
                expect(calendar.component(.day, from: expectDate)) == 10
                expect(calendar.component(.hour, from: expectDate)) == 3
                expect(calendar.component(.minute, from: expectDate)) == 0
                expect(calendar.component(.second, from: expectDate)) == 1
            })
        }
    }
}
