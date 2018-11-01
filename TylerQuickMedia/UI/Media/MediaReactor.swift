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
    let repository: MediumRepositoryType
    let mapper: MediumMapper

    init(_ repository: MediumRepositoryType, mapper: MediumMapper) {
        self.repository = repository
        self.mapper = mapper
    }

    enum Action {
        case searchMedium(String)
        case nextPage
        case setSearchOption(SearchSortType, SearchCategoryOptionType)
    }
    struct State {
        var isLoading: Bool = false
        var error: Error?
        var mediumModel: [MediumModel]?
        var keyword: String?
        var sortOptions: SearchSortType = SearchSortType.recency
        var catogoryOptions: SearchCategoryOptionType = [.all]
    }
    enum Mutation {
        case setKeyword(String)
        case setMedium([MediumModel])
        case setError(Error)
        case setSearchOptions(SearchSortType, SearchCategoryOptionType)
        case setLoading(Bool)
    }
    func mutate(action: Action) -> Observable<Mutation> {
        logger.debug("mutate action: \(action)")

        switch action {
        case let .setSearchOption(sort, category):
            return Observable.just(.setSearchOptions(sort, category))
        case .nextPage:
            guard let keyword = self.currentState.keyword else { return Observable.just(.setLoading(false)) }
            return Observable.concat([
                Observable.just(.setLoading(true)),
                self.repository.nextMedium(keyword)
                    .map { medium in medium.map(self.mapper.map) }
                    .map { r in return Mutation.setMedium(r) }.asObservable(),
                Observable.just(.setLoading(false))
                ])
                .catchError { .just(.setError($0)) }

        case let .searchMedium(keyword):
            return Observable.concat([
                Observable.just(.setKeyword(keyword)),
                Observable.just(.setLoading(true)),
                self.repository.searchMedium(keyword, searchOptions: [.all])
                    .map { medium in medium.map(self.mapper.map) }
                    .map { r in return Mutation.setMedium(r) }.asObservable(),
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
        case let .setSearchOptions(sortOptions, categoryOptions):
            newState.sortOptions = sortOptions
            newState.catogoryOptions = categoryOptions
        case .setKeyword(let keyword):
            newState.keyword = keyword
        }
        return newState
    }
}

extension MediaReactor {
    private func searchMedium(_ keyword: String) -> Observable<Mutation> {
        return self.repository.searchMedium(keyword, searchOptions: [.all])
            .map { medium in medium.map(self.mapper.map) }
            .map {
                r in return Mutation.setMedium(r)
            }
            .asObservable()
    }
}
