//
//  MediumLocalSourceTYpe.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 28..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxSwift

protocol MediumLocalSourceType {
    func getMedium(_ keyword: String) -> Single<[Medium]>
    func getSearchResult(_ keyword: String) -> MediumSearchResult
    func saveMedium(_ medium: [Medium])
    func saveSearchResult(_ searchResult: MediumSearchResult)
}
