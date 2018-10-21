//
//  TEST.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import Moya
import Swinject
import SwinjectStoryboard

#if DEBUG
let loggerPlugin = NetworkLoggerPlugin(verbose: true)
#else
class ProxyPlugin: PluginType { }

let loggerPlugin = ProxyPlugin()
#endif

let rootContainer: Container = {
    let container = Container()

    let moyaPlugins: [PluginType] = [AccessTokenPlugin(), loggerPlugin]
    let kakaoProvider = MoyaProvider<KakaoApi>(
        manager: DefaultAlamofireManager.sharedManager,
        plugins: moyaPlugins)
    
    let naverProvider = MoyaProvider<NaverApi>(
        manager: DefaultAlamofireManager.sharedManager,
        plugins: moyaPlugins)
    
    container.register(KakaoServiceType.self) { _ in KakaoService(kakaoProvider) }.inObjectScope(.container)
    container.register(NaverServiceType.self) { _ in NaverService(naverProvider) }.inObjectScope(.container)
    return container
}()

let mediaContainer: Container = {
    let container = Container(parent: rootContainer)
    
    container.register(MediaReactor.self) { r in
        let kakaoService = r.resolve(KakaoServiceType.self)!
        let naverService = r.resolve(NaverServiceType.self)!
        return MediaReactor(kakaoService: kakaoService, naverService: naverService) }
    return container
}()
