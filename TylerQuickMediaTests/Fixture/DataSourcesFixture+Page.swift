import Foundation
import Cuckoo
import RxSwift
import Moya
@testable import TylerQuickMedia

extension MockKakaoRemoteSourceType {
    var pageFirstImage: KakaoImageResponse {
        return ResourcesLoader.loadJson("page_kakao_image_first")
    }
    var pageSecondImage: KakaoImageResponse {
        return ResourcesLoader.loadJson("page_kakao_image_second")
    }
    var pageFirstVClip: KakaoVClipResponse {
        return ResourcesLoader.loadJson("page_kakao_vclip_first")
    }
    var pageSecondVClip: KakaoVClipResponse {
        return ResourcesLoader.loadJson("page_kakao_vclip_second")
    }
    func pageSample() {
        func equalPage(_ pageFunc: @escaping (Int) -> Bool) -> Cuckoo.ParameterMatcher<KakaoMediumRequest> {
            return ParameterMatcher { tested in
                return pageFunc(tested.page)
            }
        }
        stub(self, block: { mock in
            when(mock.searchImages(equalPage({ $0 == 1 }))).thenReturn(Single.just(pageFirstImage))
            when(mock.searchImages(equalPage({ $0 == 2 }))).thenReturn(Single.just(pageSecondImage))
            when(mock.searchImages(equalPage({ $0 > 2 }))).thenReturn(Single.error(MoyaError.statusCode(Response(statusCode: 400, data: ResourcesLoader.readData("kakao_reach_end_error")))))
            
            when(mock.searchVclip(equalPage({ $0 == 1 }))).thenReturn(Single.just(pageFirstVClip))
            when(mock.searchVclip(equalPage({ $0 == 2 }))).thenReturn(Single.just(pageSecondVClip))
            when(mock.searchVclip(equalPage({ $0 > 2 }))).thenReturn(Single.error(MoyaError.statusCode(Response(statusCode: 400, data: ResourcesLoader.readData("kakao_reach_end_error")))))
        })
    }
}

extension MockNaverRemoteSourceType {
    var pageFirstImage: NaverImageResponse {
        return ResourcesLoader.loadJson("page_naver_image_first")
    }
    var pageSecondImage: NaverImageResponse {
        return ResourcesLoader.loadJson("page_naver_image_second")
    }
    func pageSample() {
        func equalPage(_ page: Int) -> Cuckoo.ParameterMatcher<NaverMediumRequest> {
            return ParameterMatcher { tested in
                tested.start == page
            }
        }
        stub(self, block: { mock in
            when(mock.searchImages(equalPage(1))).thenReturn(Single.just(pageFirstImage))
            when(mock.searchImages(equalPage(2))).thenReturn(Single.just(pageSecondImage))
        })
    }
}

