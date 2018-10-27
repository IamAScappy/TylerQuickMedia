//
//  KakaoImage.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift

class KakaoImage: Medium, Decodable {
    @objc dynamic var  collection: String
    @objc dynamic var  thumbnail_url: String
    @objc dynamic var  image_url: String
    @objc dynamic var  width: Int
    @objc dynamic var  height: Int
    @objc dynamic var  display_sitename: String
    @objc dynamic var  doc_url: String
    @objc dynamic var  datetime: String
}

extension KakaoImage: MediumConvetableModel {
    func toMediumViewModel() -> MediumModel {
        return MediumModel(type: .image, thumbnail: self.thumbnail_url, origin: self.image_url, title: self.display_sitename, width: self.width, height: self.height, dateTime: self.datetime)
    }
}
