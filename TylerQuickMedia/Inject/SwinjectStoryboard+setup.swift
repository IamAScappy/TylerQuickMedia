//
//  SwinjectStoryboard+setup.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import Moya
import Swinject
import SwinjectStoryboard
import UIKit

extension SwinjectStoryboard {
    // swiftlint:disable:next attributes
    @objc class func setup() {
        Container.loggingFunction = nil
        defaultContainer.storyboardInitCompleted(MediaViewController.self) { r, c in
            c.reactor = mediaContainer.resolve(MediaReactor.self)
        }
    }
}
