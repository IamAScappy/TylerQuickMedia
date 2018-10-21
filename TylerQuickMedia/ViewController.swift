//
//  ViewController.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 20..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Moya
import RxCocoa
import RxMoya
import RxSwift
import UIKit

class ViewController: UIViewController {
    var kakaoService: KakaoServiceType!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("!!!!!! \(kakaoService)")
//        let req = KakaoImageRequest(query: "asd", sort: .accuracy, page: 1, size: 10)
//        let requestClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
//            do {
//                var request = try endpoint.urlRequest()
//                let (headerKey, value) = Enviroment.Kakao.AUTH_HEADER_FIELD
//                request.addValue(value, forHTTPHeaderField: headerKey)
//                done(.success(request))
//            } catch {
//            }
//        }
//        let provider = MoyaProvider<KakaoApi>(requestClosure: requestClosure, plugins: [NetworkLoggerPlugin(verbose: true)])

//        bbb.rx.tap.subscribe(onNext: { _ in
//            provider.rx.request(.image(req))
//                .observeOn(SerialDispatchQueueScheduler(qos: .background))
//                .subscribe(onSuccess: { _ in
//                }) { error in
//            }
//        })
    }
}
