//
//  StoryboardInitializable.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 25..
//  Copyright © 2018년 tskim. All rights reserved.
//

import UIKit
protocol StoryboardInitializable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardInitializable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }
    
    static func initFromStoryboard(name: String = "Main") -> Self {
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        // swiftlint:disable:next force_cast
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}
