import UIKit
import ReactorKit
import RxSwift
import RxDataSources
import Diff
extension MediaViewController: View, StoryboardView {
    func bind(reactor: MediaReactor) {
        logger.debug("bind")

        searchController.searchBar.rx.text
            .orEmpty
            .debounce(1, scheduler: MainScheduler.asyncInstance)
            .distinctUntilChanged()
            .filter({ !$0.isEmpty })
            .do(onNext: { keyword in logger.debug("Media query: \(keyword)") })
            .map { Reactor.Action.searchMedium(keyword: $0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        let dataSource = RxCollectionViewSectionedAnimatedDataSource<MediumViewModel>(
            configureCell: configureCell
        )


        reactor.state.map { $0.mediumModel }
            .distinctUntilChanged()
            .asDriver(onErrorJustReturn: [])
            .filterNil()
//            .do(onNext: { models in
//                logger.debug("medium: \(String(describing: models.count))")
//            })
//            .map({ models in
//                return [MediumViewModel(header: "1", items: models)]
//            })
//            .drive(self.uiCollectionView.rx.items(dataSource: dataSource))
            .drive(onNext: { [weak self] medium in
                guard let self = self else { return }
                
                
                logger.debug("medium: \(String(describing: medium.count))")
                self.items = medium
                self.uiCollectionView.reloadData()
//                self.uiCollectionView.reloadData()
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
                logger.error("error: ", context: error)
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
