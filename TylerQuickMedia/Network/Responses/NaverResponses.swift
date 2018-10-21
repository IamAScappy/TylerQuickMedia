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

struct NaverImageResponse: Decodable {
    let display: Int
    let start: Int
    let total: Int
    let lastBuildDate: Date
    let items: [NaverImage]
}
