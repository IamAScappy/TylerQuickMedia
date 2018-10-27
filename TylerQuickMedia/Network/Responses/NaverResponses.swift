//
//  NaverResponses.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

struct NaverImage: Decodable, Medium {
    let title: String
    let link: String
    let thumbnail: String
    let sizeheight: String
    let sizewidth: String
}

extension NaverImage: MediumConvetableModel {
    func toMediumViewModel() -> MediumModel {
        let width = Int(self.sizewidth) ?? 0
        let height = Int(self.sizeheight) ?? 0
        return MediumModel(type: .image, thumbnail: self.thumbnail, origin: self.link, title: self.title, width: width, height: height, dateTime: "")
    }
}


struct NaverImageResponse: Decodable, MediumResponsable {
    func isEnd() -> Bool {
        return self.isEnd() || start >= NaverImageResponse.limitPage
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
