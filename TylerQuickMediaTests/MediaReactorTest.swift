import Nimble
import Quick
import RxSwift
import RxTest
//import RxExpect
@testable import TylerQuickMedia
class MediaReactorTest: RealmSpec {
    let resolution: TimeInterval = 0.2 // seconds

    override func spec() {
        super.spec()
        var reactor: MediaReactor!
        var repository: MediumRepositoryType!
        var remote: MediumRemoteSourceType!
        var kakaoService: MockKakaoRemoteSourceType!
        var naverService: MockNaverRemoteSourceType!
        var scheduler: TestScheduler!
        beforeEach {
            scheduler = TestScheduler(initialClock: 0, resolution: 0.2, simulateProcessingDelay: false)
            kakaoService = MockKakaoRemoteSourceType()
            naverService = MockNaverRemoteSourceType()
            remote = MediumRemoteSource(kakaoService: kakaoService, naverService: naverService)
            repository = MediumRepository(remote: remote, scheduler: RxDispatchQueue())
            reactor = MediaReactor(repository)
            kakaoService.pageSample()
            naverService.pageSample()
        }
        describe("MediaReactorTest") {
            it("", closure: {
//                let test = RxExpect()
//                let reactor = test.retain(reactor)
//                let actions = scheduler.createHotObservable([
//                    next(100, { MediaReactor.Action.searchMedium("test") }),
//                    next(200, { MediaReactor.Action.nextPage })
//                    ])
                let actions = scheduler.createHotObservable([
                    next(1, { MediaReactor.Action.searchMedium("test") }),
                    next(2, { MediaReactor.Action.nextPage }),
                    completed(5)
                    ])
                
//                actions
//                    .map { $0() }
//                    .bind(to: reactor.action)

                scheduler.start({ actions.map { $0() } })

                let result = try! reactor.state.map({ $0.mediumModel })
                    .toBlocking()
                    .materialize()

                print("!!!!!!!! \(result)")
            })
        }
    }
}

