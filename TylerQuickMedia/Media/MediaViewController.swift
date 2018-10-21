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
import Then
import SnapKit
class MediaViewController: UIViewController, HasDisposeBag, DeallocationView {
    let searchController = UISearchController(searchResultsController: nil)
    let activityIndicator = ReplicateActivityIndicator()
    override func viewDidLoad() {
        super.viewDidLoad()
        enableMemoryLeakCheck(disposeBag)
        self.navigationItem.do {
            $0.searchController = searchController
            $0.hidesSearchBarWhenScrolling = false
        }
        self.searchController.do {
            $0.dimsBackgroundDuringPresentation = false
        }
        activityIndicator.do {
            view.addSubview($0)
            $0.snp.makeConstraints({ make in
                make.center.equalToSuperview()
            })
        }
    }
}

extension MediaViewController: View, StoryboardView {
    func bind(reactor: MediaReactor) {
        logger.debug("bind")
        let searchKeywordChange = searchController.searchBar.rx.text
            .orEmpty
            .throttle(0.5, latest: true, scheduler: MainScheduler.asyncInstance)

        Observable.just(Void())
            .map { _ in Reactor.Action.searchMedium(keyword: "") }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        reactor.state.map { $0.medium }
            .asDriver(onErrorJustReturn: [])
            .drive(onNext: { images in

            })
            .disposed(by: disposeBag)
        reactor.state.map { $0.isLoading }
            .asDriver(onErrorJustReturn: false)
            .distinctUntilChanged()
            .drive(onNext: { [weak self] isLoading in
                guard let self = self else { return }
                logger.debug("isLoading: \(isLoading)")
                self.activityIndicator.show(isLoading)
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
