//
//  DataSourcesFixture.swift
//  TylerQuickMediaTests
//
//  Created by tskim on 2018. 10. 27..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import Cuckoo
import RxSwift

@testable import TylerQuickMedia

extension MockMediumRemoteSourceType {
//    func category() {
//        stub(self, block: { mock in
//            let kakaoVclip = ResourcesLoader<KakaoVClipResponse>().loadJson("category_kakao_vclip")
//            let kakaoImage = ResourcesLoader<KakaoImageResponse>().loadJson("category_kakao_image")
//            let naverImage = ResourcesLoader<NaverImageResponse>().loadJson("category_naver_image")
//            when(mock.searchMedium(
//                any(),
//                nextInfo: any(),
//                sortOptions: any(),
//                searchOptions: any()).searchImages(any())).thenReturn(Single.just(imageSample))
//        })
//    }
}


extension MockKakaoRemoteSourceType {
    var sortRecencyImage: KakaoImageResponse {
        return ResourcesLoader<KakaoImageResponse>().loadJson("sort_kakao_image_recency")
    }
    var sortAccuracyImage: KakaoImageResponse {
        return ResourcesLoader<KakaoImageResponse>().loadJson("sort_kakao_image_accuracy")
    }
    var sortRecencyVClip: KakaoVClipResponse {
        return ResourcesLoader<KakaoVClipResponse>().loadJson("sort_kakao_vclip_recency")
    }
    var sortAccuracyVClip: KakaoVClipResponse {
        return ResourcesLoader<KakaoVClipResponse>().loadJson("sort_kakao_vclip_accuracy")
    }
    func sortSample() {
        func equalSort(_ sortType: KakaoMediumRequest.SortType) -> Cuckoo.ParameterMatcher<KakaoMediumRequest> {
            return ParameterMatcher { tested in
                tested.sort == sortType.rawValue
            }
        }
        stub(self, block: { mock in
            when(mock.searchImages(equalSort(.recency))).thenReturn(Single.just(sortRecencyImage))
            when(mock.searchImages(equalSort(.accuracy))).thenReturn(Single.just(sortAccuracyImage))
            when(mock.searchVclip(equalSort(.recency))).thenReturn(Single.just(sortRecencyVClip))
            when(mock.searchVclip(equalSort(.accuracy))).thenReturn(Single.just(sortAccuracyVClip))
        })
    }
    func mockSample() {
        stub(self, block: { mock in
            let vclipSample = ResourcesLoader<KakaoVClipResponse>().loadJson("kakaoVclipResponse")
            let imageSample = ResourcesLoader<KakaoImageResponse>().loadJson("kakaoImageResponse")
            
            when(mock.searchImages(any())).thenReturn(Single.just(imageSample))
            when(mock.searchVclip(any())).thenReturn(Single.just(vclipSample))
        })
    }
}

extension MockNaverRemoteSourceType {
    var sortSimImage: NaverImageResponse {
        return ResourcesLoader<NaverImageResponse>().loadJson("sort_naver_image_sim")
    }
    var sortDateImage: NaverImageResponse {
        return ResourcesLoader<NaverImageResponse>().loadJson("sort_naver_image_date")
    }
    
    func equalSort(_ sortType: NaverMediumRequest.SortType) -> Cuckoo.ParameterMatcher<NaverMediumRequest> {
        return ParameterMatcher { tested in
            tested.sort == sortType.rawValue
        }
    }
    func sortSample() {
        stub(self, block: { mock in
            when(mock.searchImages(equalSort(.sim))).thenReturn(Single.just(sortSimImage))
            when(mock.searchImages(equalSort(.date))).thenReturn(Single.just(sortDateImage))
        })
    }
    func mockSample() {
        stub(self, block: { mock in
            when(mock.searchImages(any())).then({ req in
                let sample = ResourcesLoader<NaverImageResponse>().loadJson("naverResponse")
                return Single.just(sample)
            })
        })
    }
}

