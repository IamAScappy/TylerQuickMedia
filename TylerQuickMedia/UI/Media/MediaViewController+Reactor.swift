import Diff
import Moya
import ReactorKit
import RxDataSources
import RxSwift
import UIKit

extension MediaViewController: View, StoryboardView {
    func bind(reactor: MediaReactor) {
        let scheduler = RxDispatchQueue()
        uiCollectionView.rx.reachedBottom
            .withLatestFrom(reactor.state.map { $0.isLoading })
            .filter { !$0 }
            .observeOn(scheduler.io)
            .map { _ in Reactor.Action.nextPage }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        searchController.searchBar.rx.text
            .orEmpty
            .debounce(1, scheduler: MainScheduler.asyncInstance)
            .distinctUntilChanged()
            .observeOn(scheduler.io)
            .filter({ !$0.isEmpty })
            .do(onNext: { keyword in
                logger.debug("Media query: \(getThreadName()) \(keyword)")
            })
            .map { Reactor.Action.searchMedium($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        reactor.state.map { $0.mediumModel }
            .distinctUntilChanged()
            .asDriver(onErrorJustReturn: [])
            .filterNil()
            .drive(onNext: { [weak self] medium in
                guard let self = self else { return }

                logger.debug("medium: \(String(describing: medium.count))")
                self.items = medium
                self.uiCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
        reactor.state.map { $0.isLoading }
            .asDriver(onErrorJustReturn: false)
            .distinctUntilChanged()
            .drive(onNext: { [weak self] isLoading in
                guard let _ = self else { return }
                logger.debug("isLoading: \(isLoading)")
            })
            .disposed(by: disposeBag)
        reactor.state.map { $0.error }
            .asDriver(onErrorJustReturn: nil)
            .filterNil()
            .drive(onNext: { error in
                logger.error("error: \(error)")
            })
            .disposed(by: disposeBag)
    }
}
