//
//  Router.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit

protocol Routable {
    func route() -> UIViewController
}

struct MediaRoute: Routable {
    func route() -> UIViewController {
        let storyBoard = UIStoryboard(name: "Media", bundle: Bundle.main)
        guard let vc = storyBoard.instantiateInitialViewController() else { fatalError("can't instaateInitalView Media") }
        return vc
    }
}
