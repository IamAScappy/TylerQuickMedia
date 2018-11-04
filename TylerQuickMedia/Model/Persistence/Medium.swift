//
//  Medium.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RealmSwift

protocol HasMedia {
    var thumbnail: String { get }
    var origin: String { get }
}

class Medium: Object {
    @objc dynamic var id: String = UUID().uuidString
    
    override static func primaryKey() -> String {
        return "id"
    }
}

extension Medium {
    var viewModel: MediumViewModel {
        if let kakaoImage = self as? KakaoImage {
            return kakaoImage.toMediumModel()
        } else if let kakaoVclip = self as? KakaoVclip {
            return kakaoVclip.toMediumModel()
        } else if let naverImage = self as? NaverImage {
            return naverImage.toMediumModel()
        } else {
            fatalError()
        }
    }
}
