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
    let moyaPlugins: [PluginType] = [AccessTokenPlugin(), loggerPlugin]
    let kakaoProvider = MoyaProvider<KakaoApi>(
        manager: DefaultAlamofireManager.sharedManager,
        plugins: moyaPlugins)

    let naverProvider = MoyaProvider<NaverApi>(
        manager: DefaultAlamofireManager.sharedManager,
        plugins: moyaPlugins)

    container.register(KakaoDataSourceType.self) { _ in KakaoDataSource(kakaoProvider) }.inObjectScope(.container)
    container.register(NaverDataSourceType.self) { _ in NaverDataSource(naverProvider) }.inObjectScope(.container)
    container.register(MediumServiceType.self) { r in MediumService(kakaoService: r.resolve(KakaoDataSourceType.self)!, naverService: r.resolve(NaverDataSourceType.self)!) }.inObjectScope(.container)
    
    container.register(MediumRepositoryType.self) { r in MediumRepository(r.resolve(MediumServiceType.self)!) }.inObjectScope(.container)
    return container
}()

let mediaContainer: Container = {
    let container = Container(parent: rootContainer)

    container.register(MediaReactor.self) { r in return MediaReactor(r.resolve(MediumRepositoryType.self)!, mapper: MediumMapper()) }
    return container
}()
