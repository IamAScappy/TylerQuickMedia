//
//  KakaoImageResponse.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

struct Meta: Decodable {
    let total_count: Int
    let pageable_count: Int
    let is_end: Bool
}
struct KakaoImage: Decodable, Medium {
    let collection: String
    let thumbnail_url: String
    let image_url: String
    let width: Int
    let height: Int
    let display_sitename: String
    let doc_url: String
    let datetime: String
}
struct KakaoVclip: Decodable, Medium {
    let title: String
    let url: String
    let datetime: String
    let thumbnail: String
    let play_time: Int
    let author: String
}
struct KakaoImageResponse: Decodable {
    let meta: Meta
    let documents: [KakaoImage]
}
struct KakaoVclipResponse: Decodable {
    let meta: Meta
    let documents: [KakaoVclip]
}
