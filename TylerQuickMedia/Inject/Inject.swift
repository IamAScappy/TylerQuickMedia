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

let rootContainer: Container = {
    let container = Container()
    #if DEBUG
//    let loggerPlugin = NetworkLoggerPlugin(verbose: true)
    class ProxyPlugin: PluginType { }
    
    let loggerPlugin = ProxyPlugin()
    #else
    class ProxyPlugin: PluginType { }
    
    let loggerPlugin = ProxyPlugin()
    #endif
    let moyaSchduler = DispatchQueue(label: "tyler-moya", qos: .userInteractive)
    let moyaPlugins: [PluginType] = [AccessTokenPlugin(), loggerPlugin]
    let kakaoProvider = MoyaProvider<KakaoApi>(
        callbackQueue: moyaSchduler,
        manager: DefaultAlamofireManager.sharedManager,
        plugins: moyaPlugins)

    let naverProvider = MoyaProvider<NaverApi>(
        callbackQueue: moyaSchduler,
        manager: DefaultAlamofireManager.sharedManager,
        plugins: moyaPlugins)

    container.register(KakaoRemoteSourceType.self) { r in KakaoRemoteSource(kakaoProvider) }.inObjectScope(.container)
    container.register(NaverRemoteSourceType.self) { r in NaverRemoteSource(naverProvider) }.inObjectScope(.container)
    container.register(MediumRemoteSourceType.self) { r in MediumRemoteSource(kakaoService: r.resolve(KakaoRemoteSourceType.self)!, naverService: r.resolve(NaverRemoteSourceType.self)!) }.inObjectScope(.container)
    
    container.register(RxDispatchQueue.self, factory: { _ in RxDispatchQueue() }).inObjectScope(.container)
    
    container.register(MediumRepositoryType.self) { r in
        MediumRepository(remote: r.resolve(MediumRemoteSourceType.self)!) }.inObjectScope(.container)
    return container
}()

let mediaContainer: Container = {
    let container = Container(parent: rootContainer)

    container.register(MediaReactor.self) { r in return MediaReactor(r.resolve(MediumRepositoryType.self)!, scheduler: r.resolve(RxDispatchQueue.self)!) }
    return container
}()
