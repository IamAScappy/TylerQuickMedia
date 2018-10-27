import Diff
import ReactorKit
import RxDataSources
import RxSwift
import UIKit

extension MediaViewController: View, StoryboardView {
    func bind(reactor: MediaReactor) {
        logger.debug("bind")

        uiCollectionView.rx.reachedBottom
            .withLatestFrom(reactor.state.map { $0.isLoading })
            .filter { !$0 }
            .withLatestFrom(searchController.searchBar.rx.text.orEmpty)
            .filter({ !$0.isEmpty })
            .map { Reactor.Action.searchMedium(keyword: $0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        searchController.searchBar.rx.text
            .orEmpty
            .debounce(1, scheduler: MainScheduler.asyncInstance)
            .distinctUntilChanged()
            .filter({ !$0.isEmpty })
            .do(onNext: { keyword in logger.debug("Media query: \(keyword)") })
            .map { Reactor.Action.searchMedium(keyword: $0) }
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
    func configureCell(dataSource: UICollectionViewDataSource, collectionView:UICollectionView, indexPath:IndexPath, element: MediumModel) -> UICollectionViewCell  {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaCollectionCell.swiftIdentifier, for: indexPath) as? MediaCollectionCell else { fatalError() }
        guard let item = items?[indexPath.row] else { return cell }
        cell.configCell(item)
        return cell
    }
}
