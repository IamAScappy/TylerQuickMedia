import Diff
import Moya
import ReactorKit
import RxDataSources
import RxSwift
import UIKit

extension MediaViewController: View, StoryboardView {
    func bind(reactor: MediaReactor) {
        logger.debug("bind")

        let sc = SerialDispatchQueueScheduler(internalSerialQueueName: "test")
        uiCollectionView.rx.reachedBottom
            .withLatestFrom(reactor.state.map { $0.isLoading })
            .filter { !$0 }
            .map { _ in Reactor.Action.nextPage }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        searchController.searchBar.rx.text
            .orEmpty
            .debounce(1, scheduler: sc)
            .distinctUntilChanged()
            .filter({ !$0.isEmpty })
            .do(onNext: { keyword in logger.debug("Media query: \(keyword)") })
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

private extension MediaViewController {
    func configureCell(dataSource: UICollectionViewDataSource, collectionView: UICollectionView, indexPath: IndexPath, element: MediumModel) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaCollectionCell.swiftIdentifier, for: indexPath) as? MediaCollectionCell else { fatalError() }
        guard let item = items?[indexPath.row] else { return cell }
        cell.configCell(item)
        return cell
    }
}
