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
struct KakaoImageResponse: Decodable, Equatable, MediumResponsable {
    func isEnd() -> Bool {
        return self.meta.is_end
    }

    let meta: Meta
    let documents: [KakaoImage]
}
struct KakaoVclipResponse: Decodable, Equatable, MediumResponsable {
    func isEnd() -> Bool {
        return self.meta.is_end
    }

    let meta: Meta
    let documents: [KakaoVclip]
}

