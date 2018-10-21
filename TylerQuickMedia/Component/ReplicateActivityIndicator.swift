//
//  ReplicateActivityIndicator.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import UIKit
class ReplicateActivityIndicator: UIView {
    private var activityIndicatorAnimation: CALayer = {
        let bar = CALayer().then {
            $0.frame = CGRect(x: 0, y: 0, width: 10, height: 20)
            $0.backgroundColor = UIColor.red.cgColor
        }
        
        let lay = CAReplicatorLayer().then {
            $0.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
            $0.addSublayer(bar)
            $0.instanceCount = 5
            $0.instanceTransform = CATransform3DMakeTranslation(20, 0, 0)
        }
        let anim = CABasicAnimation(keyPath: #keyPath(CALayer.opacity)).then {
            $0.fromValue = 1.0
            $0.toValue = 0.2
            $0.duration = 1
            $0.repeatCount = .greatestFiniteMagnitude
        }
        
        bar.add(anim, forKey: nil)
        lay.instanceDelay = anim.duration / Double(lay.instanceCount)
        return lay
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func show(_ isShow: Bool) {
        if isShow {
            self.layer.addSublayer(activityIndicatorAnimation)
            activityIndicatorAnimation.position = CGPoint(self.bounds.midX, self.bounds.midY)
        } else {
            hide()
        }
    }
    func hide() {
        self.layer.removeFromSuperlayer()
    }
}
