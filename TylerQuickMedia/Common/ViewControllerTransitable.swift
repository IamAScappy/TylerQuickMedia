//
//  ViewControllerTransitable.swift
//  TylerQuickMedia
//
//  Created by tskim on 08/11/2018.
//  Copyright © 2018 tskim. All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerTransitable {
    associatedtype FROM: UIView
    associatedtype TO: UIViewController
    associatedtype ITEM: Equatable
    func prepare(from: FROM, item: ITEM) -> TO
}
