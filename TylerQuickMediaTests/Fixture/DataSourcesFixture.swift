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
    func mockSample() {
        stub(self, block: { mock in
            let vclipSample = ResourcesLoader<KakaoVClipResponse>().loadJson("kakaoVclipResponse")
            let imageSample = ResourcesLoader<KakaoImageResponse>().loadJson("kakaoImageResponse")
            when(mock.searchImages(any())).thenReturn(Single.just(imageSample))
            when(mock.searchVclip(any())).thenReturn(Single.just(vclipSample))
//            when(mock.searchMedium(any())).then({ req in
//                var medium: [Medium] = []
//                medium.append(contentsOf: vclipSample.documents)
//                medium.append(contentsOf: imageSample.documents)
//                return Single.just(medium)
//            })
        })
    }
}

extension MockNaverRemoteSourceType {
    func mockSample() {
        stub(self, block: { mock in
            when(mock.searchImages(any())).then({ req in
                let sample = ResourcesLoader<NaverImageResponse>().loadJson("naverResponse")
                return Single.just(sample)
            })
        })
    }
}
