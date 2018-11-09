import Kingfisher
import PinterestLayout
import UIKit

public class MediaPreviewCell: UICollectionViewCell, SwiftNameIdentifier {
    let thumbnailView = UIImageView()
    let annotationView = AnnotationView()
    let roundedCornersView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = Dimens.Media.cornerRadius.rawValue
        view.backgroundColor = .white
        return view
    }()

    private var imageHeight: CGFloat = 50

    override init(frame: CGRect) {
        super.init(frame: frame)
        roundedCornersView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.frame = bounds
            contentView.addSubview($0)
            $0.snp.makeConstraints({ make in
                make.edges.equalToSuperview()
            })
        }
        thumbnailView.do {
            roundedCornersView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.snp.makeConstraints({ make in
                make.leading.equalToSuperview()
                make.top.equalToSuperview()
                make.trailing.equalToSuperview()
                make.height.equalTo(imageHeight)
            })
            $0.clipsToBounds = true
            $0.layer.cornerRadius = Dimens.Media.cornerRadius.rawValue
        }
        annotationView.do {
            roundedCornersView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.snp.makeConstraints({ make in
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                make.top.equalTo(thumbnailView.snp.bottom)
                make.bottom.equalToSuperview().priority(750)
            })
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let attributes = layoutAttributes as? PinterestLayoutAttributes {
            imageHeight = attributes.imageHeight
            thumbnailView.snp.updateConstraints { make in
                make.height.equalTo(attributes.imageHeight)
            }
        }
    }
}

extension MediaPreviewCell {
    func configCell(_ item: MediumViewModel) {
        let thumbnailURL = URL(string: item.thumbnail)
        thumbnailView.kf.setImage(
            with: thumbnailURL,
            placeholder: nil,
            options: [.transition(ImageTransition.fade(1))],
            progressBlock: { receivedSize, totalSize in },
            completionHandler: { image, error, cacheType, imageURL in })
        annotationView.bindView(AnnotationViewModel())
    }
}
