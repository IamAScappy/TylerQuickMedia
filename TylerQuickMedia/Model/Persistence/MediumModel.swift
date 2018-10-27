//
//  MediumModel.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import IGListKit
import RealmSwift
import RxDataSources

protocol MediumConvetableModel {
    func toMediumViewModel() -> MediumModel
}

enum MediumType: String {
    case vclip
    case image
}

class MediumModel: Object {
    @objc dynamic var medium_id: String = UUID().uuidString
    @objc dynamic var type: String = MediumType.image.rawValue
    @objc dynamic var thumbnail: String = ""
    @objc dynamic var origin: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var width: Int = 0
    @objc dynamic var height: Int = 0
    @objc dynamic var dateTime: String = ""

    override static func primaryKey() -> String {
        return "medium_id"
    }

    convenience init(type: MediumType, thumbnail: String, origin: String, title: String, width: Int, height: Int, dateTime: String) {
        self.init()
        self.type = type.rawValue
        self.thumbnail = thumbnail
        self.origin = origin
        self.title = title
        self.width = width
        self.height = height
        self.dateTime = dateTime
    }
}

extension MediumModel: IdentifiableType {
    var identity: String {
        return origin
    }
}

extension MediumModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return medium_id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? MediumModel else { return false }
        return self == object
    }
}
