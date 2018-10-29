//
//  ㅁ.swift
//  Pods
//
//  Created by tskim on 2018. 10. 2..
//

import DeallocationChecker
import Foundation
import UIKit

extension AppDelegate {
    func checkDeallocation() {
        let isRunningUnderUITests = ProcessInfo.processInfo.environment["uitests"] != nil
        
        #if DEBUG
        if isRunningUnderUITests {
            DeallocationChecker.shared.setup(with: .callback(makeUITestsCallback()))
        } else {
            DeallocationChecker.shared.setup(with: .alert)
        }
        #endif
    }
    private func makeUITestsCallback() -> DeallocationChecker.Callback {
        return { leakState, _ in
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = UIViewController()
            window.makeKeyAndVisible()
            
            let message: String
            switch leakState {
            case .leaked:
                message = "leaked"
            case .notLeaked:
                message = "notLeaked"
            }
            
            let alertController = UIAlertController(title: "Leak Status", message: message, preferredStyle: .alert)
            alertController.addAction(.init(title: "OK", style: .cancel, handler: nil))
            
            window.rootViewController?.present(alertController, animated: false, completion: nil)
        }
    }
}
