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

    let moyaPlugins: [PluginType] = [KakaoAuthPlugin, LoggerPlugin]
    let kakaoProvider = MoyaProvider<KakaoApi>(
        manager: DefaultAlamofireManager.sharedManager,
        plugins: moyaPlugins)
    container.register(KakaoServiceType.self) { _ in KakaoService(kakaoProvider) }.inObjectScope(.container)
    return container
}()

let mediaContainer: Container = {
    let container = Container(parent: rootContainer)
    container.register(MediaReactor.self) { r in MediaReactor(r.resolve(KakaoServiceType.self)!) }
    return container
}()
