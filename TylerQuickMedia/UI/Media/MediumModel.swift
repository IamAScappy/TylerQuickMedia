//
//  MediumModel.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxDataSources

protocol MediumConvetableModel {
    func toMediumViewModel() -> MediumModel
}

struct MediumModel: Equatable {
    enum MediumType {
        case vclip
        case image
    }
    
    let type: MediumType
    let thumbnail: String
    let origin: String
    let title: String
    let width: Int
    let height: Int
    let dateTime: String
}
extension MediumModel : IdentifiableType {
    var identity: String {
        return origin
    }
}
