//
//  VideoViewController.swift
//  TylerQuickMedia
//
//  Created by tskim on 04/11/2018.
//  Copyright © 2018 tskim. All rights reserved.
//

import Foundation
import UIKit

class VideoViewController: UIViewController {
    private let playView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playView.do {
            view.addSubview($0)
            $0.snp.makeConstraints({ make in
                make.edges.equalToSuperview()
            })
            $0.backgroundColor = UIColor.blue
        }
    }
    init (heroId: String, item: MediumViewModel) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
