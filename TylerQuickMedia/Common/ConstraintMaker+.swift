//
//  ConstraintMaker+.swift
//  TylerQuickMedia
//
//  Created by tskim on 04/11/2018.
//  Copyright © 2018 tskim. All rights reserved.
//

import Foundation
import SnapKit

extension ConstraintMaker {
    func aspectRatio(_ x: Int, by y: Int, self instance: ConstraintView) {
        self.width.equalTo(instance.snp.height).multipliedBy(x / y)
    }
}
