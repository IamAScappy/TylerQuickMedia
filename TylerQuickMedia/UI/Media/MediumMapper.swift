//
//  MediumMapper.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

class MediumMapper {
    func map(media: Medium) -> MediumModel {
        if let kakaoImage = media as? KakaoImage {
            return kakaoImage.toMediumViewModel()
        } else if let kakaoVclip = media as? KakaoVclip {
            return kakaoVclip.toMediumViewModel()
        } else if let naverImage = media as? NaverImage {
            return naverImage.toMediumViewModel()
        } else {
            fatalError()
        }
    }
}
