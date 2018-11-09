//
//  DetailTransition.swift
//  TylerQuickMedia
//
//  Created by tskim on 08/11/2018.
//  Copyright © 2018 tskim. All rights reserved.
//

import Foundation
import UIKit

class DetailTransition: ViewControllerTransitable {
    func prepare(from: MediaPreviewCell, item: MediumViewModel) -> DetailViewController {
        let heroId = "\(item.origin)"
        
        from.thumbnailView.hero.id = heroId
        from.thumbnailView.hero.modifiers = [.useNoSnapshot, .spring(stiffness: 250, damping: 25)]
        
        return DetailViewController(heroId: heroId, item: item).then {
            $0.hero.isEnabled = true
            $0.hero.modalAnimationType = .none
            $0.imageView.hero.modifiers = [.source(heroID: heroId), .spring(stiffness: 250, damping: 25)]
        }
    }
}
