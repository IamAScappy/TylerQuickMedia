//
//  MediumBoundResource.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

class MediumBoundResource: DataBoundResourceType, TimeRateLimitable {

    typealias RESULT = MediumSearchResult?
    typealias DATA = [Medium]

    var freshTime: Int = 20 * 60 // 20 minute

    func needFresh(lastestDate: Date) -> Bool {
        if lastestDate.timeIntervalSinceNow.advanced(by: Double(-freshTime)) < 0 {
            return false
        } else {
            return true
        }
    }

    func saveResult(data: [Medium]) throws {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(data)
            }

        } catch let error {
            logger.error("error: \(error)")
        }
    }

    func shouldFetch(result: MediumSearchResult?) -> Bool {
        guard let result = result else { return true }
        return needFresh(lastestDate: result.updatedTime)
    }

    func loadFromLocal() -> [Medium] {
        do {
            let realm = try Realm()
            realm.filter(
                parentType: Medium.self,
                subclasses: [KakaoImage.self, NaverImage.self, KakaoVclip.self],
                predicate: NSPredicate(format: "id IN %@", result.medium_ids))
        } catch let error {
            
        }
        
        return []
    }

    func createRemoteCall() -> PrimitiveSequence<SingleTrait, [Medium]> {

    }
}
