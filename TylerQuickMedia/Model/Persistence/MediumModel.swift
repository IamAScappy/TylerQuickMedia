//
//  MediumModel.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

protocol MediumConvetableModel {
    func toMediumModel() -> MediumModel
}

enum MediumType: String {
    case vclip
    case image
}

struct MediumModel: Equatable, HasMedia {
    let type: MediumType
    let thumbnail: String
    let origin: String
    let title: String
    let width: Int
    let height: Int
    let dateTime: String
}

//extension MediumModel: IdentifiableType {
//    var identity: String {
//        return origin
//    }
//}
//
//extension MediumModel: ListDiffable {
//    func diffIdentifier() -> NSObjectProtocol {
//        return medium_id as NSObjectProtocol
//    }
//
//    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
//        guard self !== object else { return true }
//        guard let object = object as? MediumModel else { return false }
//        return self == object
//    }
//}
