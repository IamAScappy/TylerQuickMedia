//
//  MediumBoundResourceTest.swift
//  TylerQuickMediaTests
//
//  Created by tskim on 2018. 11. 1..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Nimble
import Quick
@testable import TylerQuickMedia

class MediumBoundResourceTest: QuickSpec {
    override func spec() {
        
        var subject: MediumBoundResource!
        var remote: MockMediumRemoteSourceType!
        var local: MockMediumLocalSourceType!
        beforeEach {
            remote = MockMediumRemoteSourceType()
            local = MockMediumLocalSourceType()
            subject = MediumBoundResource(remote: remote, local: local)
        }
        describe("") {
            it("", closure: {
            })
        }
    }
}
