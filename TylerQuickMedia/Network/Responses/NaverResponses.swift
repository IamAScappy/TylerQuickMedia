//
//  NaverResponses.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

struct NaverImageResponse: Decodable, MediumResponsable {
    func isEnd() -> Bool {
        return self.start == self.total || start >= NaverImageResponse.limitPage
    }

    let display: Int
    let start: Int
    let total: Int
    let lastBuildDate: String
    let items: [NaverImage]
}
extension NaverImageResponse {
    static var limitPage = 1000
}
