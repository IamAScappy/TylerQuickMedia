//
//  MediaCollectionCell.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 22..
//  Copyright © 2018년 tskim. All rights reserved.
//

import UIKit
import Kingfisher
import PinterestLayout

class MediaCollectionCell: UICollectionViewCell, SwiftNameIdentifier {
    private lazy var playButton = {
        return UIButton()
    }()
    let thumbnailView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        thumbnailView.do {
            contentView.addSubview($0)
            $0.snp.makeConstraints({ make in
                make.edges.equalToSuperview()
            })
        }
    }
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let attributes = layoutAttributes as? PinterestLayoutAttributes {
            print("!!!!!!!! \(attributes)")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MediaCollectionCell {
    func configCell(_ item: MediumModel) {
        switch item.type {
        case .vclip:
            self.playButton.isHidden = false
        default:
            self.playButton.isHidden = true
        }
        let thumbnailURL = URL(string: item.thumbnail)
        thumbnailView.kf.setImage(
            with: thumbnailURL,
            placeholder: nil,
            options: [.transition(ImageTransition.fade(1))],
            progressBlock: { receivedSize, totalSize in
                
        },
            completionHandler: { image, error, cacheType, imageURL in
                
        })
    }
}
