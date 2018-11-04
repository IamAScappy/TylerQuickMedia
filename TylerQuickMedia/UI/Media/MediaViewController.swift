//
//  MediaViewController.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Kingfisher
import PinterestLayout
import ReactorKit
import RxCocoa
import RxOptional
import RxSwift
import SnapKit
import Then
import UIEmptyState
import UIKit

extension UIScrollView {
    func isNearBottomEdge(edgeOffset: CGFloat = 20.0) -> Bool {
        return contentOffset.y + frame.size.height + edgeOffset > contentSize.height
    }
}
class MediaViewController: UIViewController, HasDisposeBag, DeallocationView {
    @IBOutlet weak var uiCollectionView: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    lazy var pinterestLayout = PinterestLayout()
    var items: [MediumViewModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        uiCollectionView.collectionViewLayout = pinterestLayout
        enableMemoryLeakCheck(disposeBag)
        self.emptyStateDataSource = self
        self.emptyStateDelegate = self
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.do {
            $0.searchController = searchController
            $0.hidesSearchBarWhenScrolling = false
            $0.title = "미디어"
        }

        self.searchController.do {
            $0.dimsBackgroundDuringPresentation = false
            $0.searchBar.placeholder = "검색어를 입력해 주세요."
        }
        uiCollectionView.do {
            $0.register(MediaPreviewCell.self, forCellWithReuseIdentifier: MediaPreviewCell.swiftIdentifier)
            $0.prefetchDataSource = self
            $0.dataSource = self
            $0.rx.setDelegate(self).disposed(by: disposeBag)
        }
        pinterestLayout.do {
            $0.delegate = self
            $0.numberOfColumns = 2
            $0.cellPadding = 5
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        uiCollectionView.frame = view.bounds
    }
}

extension MediaViewController: PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
        guard let item = items?[indexPath.row] else { return Dimens.Media.defaultHeightMin.rawValue }
        let scale: CGFloat = CGFloat(item.height) / CGFloat(item.width)
        let height = withWidth * scale
        return height
    }

    func collectionView(collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
        return 0
    }
}

extension MediaViewController: UIScrollViewDelegate {

}
extension MediaViewController: UICollectionViewDataSourcePrefetching, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        let images = indexPaths.compactMap { indexPath -> URL? in
            guard let item = items?[indexPath.row] else { return nil }
            return URL(string: item.origin)
        }
        ImagePrefetcher(urls: images).start()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaPreviewCell.swiftIdentifier, for: indexPath) as? MediaPreviewCell else {
            fatalError()
        }
        guard let item = items?[indexPath.row] else { return cell }
        
        cell.configCell(item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as? MediaPreviewCell)?.cancelDownloadTask()
    }
}
