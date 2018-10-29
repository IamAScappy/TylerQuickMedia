import DeallocationChecker
import Foundation
import RxCocoa
import RxSwift

private let keyDeallocationDisposeBag = "deallocationDisposeBag"

protocol DeallocationView: class {
}

extension DeallocationView where Self: UIViewController {
    func enableMemoryLeakCheck(_ disposeBag: DisposeBag) {
        self.rx.viewDidDisappear.asDriver().drive(onNext: { _ in
            DeallocationChecker.shared.checkDeallocation(of: self)
        }).disposed(by: disposeBag)
    }
}
