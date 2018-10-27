//
//  NaverImage.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

class NaverImage: Medium, Decodable {
    @objc dynamic var  title: String
    @objc dynamic var  link: String
    @objc dynamic var  thumbnail: String
    @objc dynamic var  sizeheight: String
    @objc dynamic var  sizewidth: String
}

extension NaverImage: MediumConvetableModel {
    func toMediumViewModel() -> MediumModel {
        let width = Int(self.sizewidth) ?? 0
        let height = Int(self.sizeheight) ?? 0
        return MediumModel(type: .image, thumbnail: self.thumbnail, origin: self.link, title: self.title, width: width, height: height, dateTime: "")
    }
}
