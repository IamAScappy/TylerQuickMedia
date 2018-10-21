//
//  MediaReactor.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import ReactorKit
import RxSwift

class MediaReactor: Reactor {
    let initialState: State = State()
    let kakaoService: KakaoServiceType
    let naverService: NaverServiceType

    init(kakaoService kakao: KakaoServiceType, naverService naver: NaverServiceType) {
        self.kakaoService = kakao
        self.naverService = naver
    }

    enum Action {
        case searchMedium(keyword: String)
    }
    struct State {
        var isLoading: Bool = false
        var error: Error?
        var medium: [Medium]?
    }
    enum Mutation {
        case setMedium([Medium])
        case setError(Error)
        case setLoading(Bool)
    }
    func mutate(action: Action) -> Observable<Mutation> {
        logger.debug("mutate action: \(action)")
        
        switch action {
        case .searchMedium(let keyword):
            let kakaoRequest = KakaoMediumRequest(query: "aa", page: 1, size: 10)
            let naverRequest = NaverMediumRequest(query: "aa", start: 1, display: 10)
            
            return Observable.concat([
                Observable.just(.setLoading(true)),
                self.kakaoService.searchMedium(kakaoRequest).asObservable().map { Mutation.setMedium($0) },
                self.naverService.searchMedium(naverRequest).asObservable().map { Mutation.setMedium($0) },
                Observable.just(.setLoading(false))
                ])
                .catchError { .just(.setError($0)) }
        }
    }
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setMedium(let medium):
            newState.medium = medium
        case .setError(let error):
            newState.error = error
            newState.isLoading = false
        case .setLoading(let isLoading):
            newState.isLoading = isLoading
        }
        return newState
    }
}
