//
//  KakaoVclip.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift

class KakaoVclip: Medium, Decodable {
    @objc dynamic var  title: String
    @objc dynamic var  url: String
    @objc dynamic var  datetime: String
    @objc dynamic var  thumbnail: String
    @objc dynamic var  play_time: Int
    @objc dynamic var  author: String
}

extension KakaoVclip: MediumConvetableModel {
    func toMediumViewModel() -> MediumModel {
        let height = Int(Dimens.Media.videoHeightMin.rawValue)
        let width = Int(Dimens.Media.videoWidthMin.rawValue)
        return MediumModel(type: .vclip, thumbnail: self.thumbnail, origin: self.url, title: self.title, width: width, height: height, dateTime: self.datetime)
    }
}
