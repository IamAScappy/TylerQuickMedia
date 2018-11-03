import Nimble
import Quick
import ReactorKit
import RxExpect
import RxSwift
import RxTest
@testable import TylerQuickMedia
class MediaReactorTest: RealmSpec {
    let resolution: TimeInterval = 0.2 // seconds

    override func spec() {
        super.spec()
        var repository: MediumRepositoryType!
        var remote: MediumRemoteSourceType!
        var kakaoService: MockKakaoRemoteSourceType!
        var naverService: MockNaverRemoteSourceType!
        beforeEach {
            kakaoService = MockKakaoRemoteSourceType()
            naverService = MockNaverRemoteSourceType()
            remote = MediumRemoteSource(kakaoService: kakaoService, naverService: naverService)
            repository = MediumRepository(remote: remote)
            kakaoService.pageSample()
            naverService.pageSample()
        }
        describe("MediaReactorTest") {
            it("서치 할 경우 item 로드", closure: {
                let test = RxExpect()
                let reactor = test.retain(MediaReactor(repository, scheduler: RxDispatchQueue()))
                let actions = test.scheduler.createHotObservable([
                    next(100, MediaReactor.Action.searchMedium("test"))
                    ])
                actions.subscribe(reactor.action).disposed(by: test.disposeBag)
                
                test.assert(reactor.state) { events in
                    expect(reactor.currentState.keyword).toEventually(equal("test"))
                    expect(reactor.currentState.mediumModel?.count).toEventually(equal(9))
                    expect(reactor.currentState.isLoading).toEventually(equal(false))
                }
            })
        }
    }
}

