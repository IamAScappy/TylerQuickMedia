//
//  NaverImage.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

class NaverImage: Medium, Decodable, HasMedia {
    @objc dynamic var origin: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var thumbnail: String = ""
    @objc dynamic var sizeheight: String = ""
    @objc dynamic var sizewidth: String = ""
    
    enum CodingKeys: String, CodingKey {
        case origin = "link"
        case title
        case thumbnail
        case sizeheight
        case sizewidth
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        origin = try values.decode(String.self, forKey: .origin)
        thumbnail = try values.decode(String.self, forKey: .thumbnail)
        title = try values.decode(String.self, forKey: .title)
        sizeheight = try values.decode(String.self, forKey: .sizeheight)
        sizewidth = try values.decode(String.self, forKey: .sizewidth)
    }
}

extension NaverImage: MediumConvetableModel {
    func toMediumModel() -> MediumViewModel {
        let width = Int(self.sizewidth) ?? 0
        let height = Int(self.sizeheight) ?? 0
        return MediumViewModel(type: .naverImage, thumbnail: self.thumbnail, origin: self.origin, title: self.title, width: width, height: height, dateTime: Date())
    }
}
