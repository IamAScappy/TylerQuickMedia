import Foundation
import UIKit

struct AnnotationViewModel {
}

class AnnotationView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func bindView(_ viewModel: AnnotationViewModel) {
    }
}
