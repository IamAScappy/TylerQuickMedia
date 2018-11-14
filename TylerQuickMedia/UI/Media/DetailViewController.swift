//
//  DetailViewController.swift
//  TylerQuickMedia
//
//  Created by tskim on 04/11/2018.
//  Copyright © 2018 tskim. All rights reserved.
//

import Foundation
import Hero
import Kingfisher
import UIKit

class DetailViewController: UIViewController {
    let contentView = UIView()
    let imageView = UIImageView()
    private var heroId: String!
    private var item: MediumViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan(gr:))))
        contentView.addSubview(imageView)
        view.addSubview(contentView)
        let thumbnailURL = URL(string: item.origin)
        imageView.kf.setImage(
            with: thumbnailURL,
            placeholder: nil,
            options: [.transition(ImageTransition.fade(1))],
            progressBlock: { receivedSize, totalSize in },
            completionHandler: { image, error, cacheType, imageURL in })
    }
    init (heroId: String, item: MediumViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.heroId = heroId
        self.item = item
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handlePan(gr: UIPanGestureRecognizer) {
        let translation = gr.translation(in: view)
        switch gr.state {
        case .began:
            hero.dismissViewController()
//            dismiss(animated: true, completion: nil)
        case .changed:
            Hero.shared.update(translation.y / view.bounds.height)
        default:
            let velocity = gr.velocity(in: view)
            if ((translation.y + velocity.y) / view.bounds.height) > 0.5 {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let bounds = view.bounds
        contentView.frame = bounds
        imageView.frame = CGRect(x: 0, y: 100, width: bounds.width, height: bounds.width)
    }
}

class DetailCoordinator: ViewControllerTransitable {
    func prepare(from: MediaPreviewCell, item: MediumViewModel) -> DetailViewController {
        let heroId = "\(item.origin)"
        
        from.roundedCornersView.hero.id = heroId
        from.roundedCornersView.hero.modifiers = [.useNoSnapshot, .spring(stiffness: 250, damping: 25)]
        return DetailViewController(heroId: heroId, item: item).then {
            $0.hero.isEnabled = true
            $0.hero.modalAnimationType = .none
            $0.contentView.hero.id = heroId
            $0.imageView.image = from.thumbnailView.image
            $0.contentView.hero.modifiers = [.source(heroID: heroId), .spring(stiffness: 250, damping: 25)]
        }
    }
}
