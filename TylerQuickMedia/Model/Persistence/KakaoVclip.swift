//
//  KakaoVclip.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift

class KakaoVclip: Medium, Decodable, HasMedia {
    @objc dynamic var  title: String = ""
    @objc dynamic var  origin: String = ""
    @objc dynamic var  thumbnail: String = ""
    @objc dynamic var  playTime: Int = 0
    @objc dynamic var  author: String = ""
    @objc dynamic var  datetime: Date? = nil
    
    enum CodingKeys: String, CodingKey {
        case title
        case origin = "url"
        case thumbnail
        case datetime = "datetime"
        case author
        case playTime = "play_time"
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        origin = try values.decode(String.self, forKey: .origin)
        thumbnail = try values.decode(String.self, forKey: .thumbnail)
        author = try values.decode(String.self, forKey: .author)
        playTime = try values.decode(Int.self, forKey: .playTime)
        datetime = DateFormatter.iso8601Format(try values.decode(String.self, forKey: .datetime))
    }
}

extension KakaoVclip: MediumConvetableModel {
    func toMediumModel() -> MediumViewModel {
        let height = Int(Dimens.Media.videoHeightMin.rawValue)
        let width = Int(Dimens.Media.videoWidthMin.rawValue)
        return MediumViewModel(type: .kakaoVClip, thumbnail: self.thumbnail, origin: self.origin, title: self.title, width: width, height: height, dateTime: self.datetime ?? Date())
    }
}
