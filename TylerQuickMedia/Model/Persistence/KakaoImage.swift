//
//  KakaoImage.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift

class KakaoImage: Medium, Decodable, HasMedia {
    @objc dynamic var thumbnail: String = ""
    @objc dynamic var origin: String = ""
    @objc dynamic var collection: String = ""
    @objc dynamic var image_url: String = ""
    @objc dynamic var width: Int = 0
    @objc dynamic var height: Int = 0
    @objc dynamic var displaySiteName: String = ""
    @objc dynamic var doc_url: String = ""
    @objc dynamic var datetime: String = ""

    enum CodingKeys: String, CodingKey {
        case collection
        case width
        case height
        case doc_url
        case datetime
        case displaySiteName = "display_sitename"
        case thumbnail = "thumbnail_url"
        case origin = "image_url"
    }
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        collection = try values.decode(String.self, forKey: .collection)
        thumbnail = try values.decode(String.self, forKey: .thumbnail)
        origin = try values.decode(String.self, forKey: .origin)
        width = try values.decode(Int.self, forKey: .width)
        height = try values.decode(Int.self, forKey: .height)
        displaySiteName = try values.decode(String.self, forKey: .displaySiteName)
        doc_url = try values.decode(String.self, forKey: .doc_url)
        datetime = try values.decode(String.self, forKey: .datetime)
    }
}

extension KakaoImage: MediumConvetableModel {
    func toMediumModel() -> MediumModel {
        return MediumModel(type: .image, thumbnail: self.thumbnail, origin: self.origin, title: self.displaySiteName, width: self.width, height: self.height, dateTime: self.datetime)
    }
}
