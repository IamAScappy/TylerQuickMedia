//
//  MediaViewController.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import ReactorKit
import RxOptional
import RxSwift
import UIKit

class MediaViewController: UIViewController, HasDisposeBag {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MediaViewController: View, StoryboardView {
    func bind(reactor: MediaReactor) {
        logger.debug("bind")
        Observable.just(Void())
            .map { _ in Reactor.Action.searchMedium(keyword: "") }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        reactor.state.map { $0.images }
            .asDriver(onErrorJustReturn: [])
            .drive(onNext: { images in

            })
            .disposed(by: disposeBag)
        reactor.state.map { $0.isLoading }
            .asDriver(onErrorJustReturn: false)
            .distinctUntilChanged()
            .drive(onNext: { isLoading in
                logger.debug("isLoading: \(isLoading)")
            })
            .disposed(by: disposeBag)
        reactor.state.map { $0.error }
            .asDriver(onErrorJustReturn: nil)
            .filterNil()
            .drive(onNext: { error in
                logger.error("error: ", context: error)
            })
            .disposed(by: disposeBag)
    }
}
