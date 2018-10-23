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
    let service: MediumServiceType
    let mapper: MediumMapper
    
    init(_ service: MediumServiceType, mapper: MediumMapper) {
        self.service = service
        self.mapper = mapper
    }

    enum Action {
        case searchMedium(keyword: String)
    }
    struct State {
        var isLoading: Bool = false
        var error: Error?
        var mediumModel: [MediumModel]?
    }
    enum Mutation {
        case setMedium([MediumModel])
        case setError(Error)
        case setLoading(Bool)
    }
    func mutate(action: Action) -> Observable<Mutation> {
        logger.debug("mutate action: \(action)")
        
        switch action {
        case .searchMedium(let keyword):
            let kakaoRequest = KakaoMediumRequest(query: keyword, page: 1, size: 10)
            let naverRequest = NaverMediumRequest(query: keyword, start: 1, display: 10)
            
            return Observable.concat([
                Observable.just(.setLoading(true)),
                self.service.searchMedium(naverRequest: naverRequest, kakaoRequest: kakaoRequest)
                    .map { medium in medium.map(self.mapper.map) }
                    .map { r in return Mutation.setMedium(r) }
                    .asObservable(),
                Observable.just(.setLoading(false))
                ])
                .catchError { .just(.setError($0)) }
        }
    }
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setMedium(let model):
            newState.mediumModel = model
        case .setError(let error):
            newState.error = error
            newState.isLoading = false
        case .setLoading(let isLoading):
            newState.isLoading = isLoading
        }
        return newState
    }
}
