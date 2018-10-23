//
//  MediaViewModel.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 23..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxDataSources

struct MediumViewModel {
    var header: String
    var items: [Item]
}

extension MediumViewModel: AnimatableSectionModelType {
    typealias Item = MediumModel
    
    var identity: String {
        return header
    }
    
    init(original: MediumViewModel, items: [Item]) {
        self = original
        self.items = items
    }
}
