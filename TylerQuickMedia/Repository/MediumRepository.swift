//
//  MediumRepositoryType.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 23..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import RxSwift

class MediumRepository: MediumRepositoryType {
    private let boundResource: MediumBoundResource

    init(boundResource: MediumBoundResource) {
        self.boundResource = boundResource
    }

    func nextMedium(
        _ keyword: String) -> Single<[Medium]> {
        guard !keyword.isEmpty else { return Single.just([]) }
        logger.debug("next page keyword: [\(keyword)]")
        return self.boundResource.nextPage(keyword)
    }
    func searchMedium(
        _ keyword: String,
        searchOptions: SearchCategoryOptionType = SearchCategoryOptionType.all,
        sortOptions: SearchSortType = .recency) -> Single<[Medium]> {
        guard !keyword.isEmpty else { return Single.just([]) }
        logger.debug("request keyword: [\(keyword)] searchOptions: [\(searchOptions)] sortOptions: [\(sortOptions)]")
        return self.boundResource.request(RequestParam(keyword: keyword, sortOptions: sortOptions, searchOptions: searchOptions))
    }
}
