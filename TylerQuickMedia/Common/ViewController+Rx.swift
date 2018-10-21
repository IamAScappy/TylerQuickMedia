#if os(iOS)
    import UIKit

    import RxCocoa
    import RxSwift

    public extension Reactive where Base: UIViewController {
        // swiftlint:disable:next extension_access_modifier
        public var viewDidLoad: ControlEvent<Void> {
            let source = self.methodInvoked(#selector(Base.viewDidLoad)).map { _ in }
            return ControlEvent(events: source)
        }
        // swiftlint:disable:next extension_access_modifier
        public var viewWillAppear: ControlEvent<Bool> {
            let source = self.methodInvoked(#selector(Base.viewWillAppear)).map { $0.first as? Bool ?? false }
            return ControlEvent(events: source)
        }
        // swiftlint:disable:next extension_access_modifier
        public var viewDidAppear: ControlEvent<Bool> {
            let source = self.methodInvoked(#selector(Base.viewDidAppear)).map { $0.first as? Bool ?? false }
            return ControlEvent(events: source)
        }
        // swiftlint:disable:next extension_access_modifier
        public var viewWillDisappear: ControlEvent<Bool> {
            let source = self.methodInvoked(#selector(Base.viewWillDisappear)).map { $0.first as? Bool ?? false }
            return ControlEvent(events: source)
        }
        // swiftlint:disable:next extension_access_modifier
        public var viewDidDisappear: ControlEvent<Bool> {
            let source = self.methodInvoked(#selector(Base.viewDidDisappear)).map { $0.first as? Bool ?? false }
            return ControlEvent(events: source)
        }
        // swiftlint:disable:next extension_access_modifier
        public var viewWillLayoutSubviews: ControlEvent<Void> {
            let source = self.methodInvoked(#selector(Base.viewWillLayoutSubviews)).map { _ in }
            return ControlEvent(events: source)
        }
        // swiftlint:disable:next extension_access_modifier
        public var viewDidLayoutSubviews: ControlEvent<Void> {
            let source = self.methodInvoked(#selector(Base.viewDidLayoutSubviews)).map { _ in }
            return ControlEvent(events: source)
        }
        // swiftlint:disable:next extension_access_modifier
        public var willMoveToParentViewController: ControlEvent<UIViewController?> {
            let source = self.methodInvoked(#selector(Base.willMove)).map { $0.first as? UIViewController }
            return ControlEvent(events: source)
        }
        // swiftlint:disable:next extension_access_modifier
        public var didMoveToParentViewController: ControlEvent<UIViewController?> {
            let source = self.methodInvoked(#selector(Base.didMove)).map { $0.first as? UIViewController }
            return ControlEvent(events: source)
        }
        // swiftlint:disable:next extension_access_modifier
        public var didReceiveMemoryWarning: ControlEvent<Void> {
            let source = self.methodInvoked(#selector(Base.didReceiveMemoryWarning)).map { _ in }
            return ControlEvent(events: source)
        }

        /// Rx observable, triggered when the ViewController appearance state changes (true if the View is being displayed, false otherwise)
        // swiftlint:disable:next extension_access_modifier
        public var isVisible: Observable<Bool> {
            let viewDidAppearObservable = self.base.rx.viewDidAppear.map { _ in true }
            let viewWillDisappearObservable = self.base.rx.viewWillDisappear.map { _ in false }
            return Observable<Bool>.merge(viewDidAppearObservable, viewWillDisappearObservable)
        }

        /// Rx observable, triggered when the ViewController is being dismissed
        // swiftlint:disable:next extension_access_modifier
        public var isDismissing: ControlEvent<Bool> {
            let source = self.sentMessage(#selector(Base.dismiss)).map { $0.first as? Bool ?? false }
            return ControlEvent(events: source)
        }

    }
#endif
