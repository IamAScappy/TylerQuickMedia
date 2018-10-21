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
    let service: KakaoServiceType

    init(_ service: KakaoServiceType) {
        self.service = service
    }

    enum Action {
        case searchMedium(keyword: String)
    }
    struct State {
        var isLoading: Bool = false
        var error: Error?
        var images: [KakaoImage]?
        var vclips: [KakaoVclip]?
    }
    enum Mutation {
        case setImages([KakaoImage])
        case setVclips([KakaoVclip])
        case setError(Error)
        case setLoading(Bool)
    }
    func mutate(action: Action) -> Observable<Mutation> {
        logger.debug("mutate action: \(action)")

        switch action {
        case .searchMedium(let keyword):
            let request = KakaoMediumRequest(query: "aa", page: 1, size: 10)
            return Observable.concat([
                Observable.just(.setLoading(true)),
                self.service.searchImages(request).asObservable().map { Mutation.setImages($0.documents) },
                self.service.searchVclip(request).asObservable().map { Mutation.setVclips($0.documents) },
                Observable.just(.setLoading(false))
                ])
                .catchError { .just(.setError($0)) }
        }
    }
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setImages(let images):
            newState.images = images
        case .setError(let error):
            newState.error = error
            newState.isLoading = false
        case .setLoading(let isLoading):
            newState.isLoading = isLoading
        case .setVclips(let vclips):
            newState.vclips = vclips
        }
        return newState
    }
}
