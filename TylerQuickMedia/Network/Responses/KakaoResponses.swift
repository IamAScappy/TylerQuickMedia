//
//  KakaoImageResponse.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

struct Meta: Decodable, Equatable {
    let total_count: Int
    let pageable_count: Int
    let is_end: Bool
    
    public init(total_count: Int, pageable_count: Int, is_end: Bool) {
        self.total_count = total_count
        self.pageable_count = pageable_count
        self.is_end = is_end
    }
}
extension Meta {
    static var INSTANCE_END = Meta(total_count: 0, pageable_count: 0, is_end: true)
}

struct KakaoImage: Decodable, Medium, Equatable {
    let collection: String
    let thumbnail_url: String
    let image_url: String
    let width: Int
    let height: Int
    let display_sitename: String
    let doc_url: String
    let datetime: String
}

extension KakaoImage: MediumConvetableModel {
    func toMediumViewModel() -> MediumModel {
        return MediumModel(type: .image, thumbnail: self.thumbnail_url, origin: self.image_url, title: self.display_sitename, width: self.width, height: self.height, dateTime: self.datetime)
    }
}

struct KakaoVclip: Decodable, Medium, Equatable {
    let title: String
    let url: String
    let datetime: String
    let thumbnail: String
    let play_time: Int
    let author: String
}

extension KakaoVclip: MediumConvetableModel {
    func toMediumViewModel() -> MediumModel {
        let height = Int(Dimens.Media.videoHeightMin.rawValue)
        let width = Int(Dimens.Media.videoWidthMin.rawValue)
        return MediumModel(type: .vclip, thumbnail: self.thumbnail, origin: self.url, title: self.title, width: width, height: height, dateTime: self.datetime)
    }
}
struct KakaoResponse: Decodable, Equatable, KakaoResponsable {
    let meta: Meta
    let documents: [KakaoImage]
}

protocol KakaoResponsable: MediumResponsable {
    associatedtype Data where Data: Medium

    var meta: Meta { get }
    var documents: [Data] { get }
}

extension KakaoResponsable {
    func isEnd() -> Bool {
        return self.meta.is_end
    }
}
