//
//  SwinjectStoryboard+setup.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard
import UIKit
import  Moya
extension SwinjectStoryboard {
    // swiftlint:disable:next attributes
    @objc class func setup() {
        let rootContainer: Container = {
            let container = Container()
            
            #if DEBUG
            let loggerPlugin = NetworkLoggerPlugin(verbose: true)
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
            
            container.register(KakaoServiceType.self) { _ in KakaoService(kakaoProvider) }
            container.register(NaverServiceType.self) { _ in NaverService(naverProvider) }
            container.register(MediumServiceType.self) { r in
                MediumService(kakaoService: r.resolve(KakaoServiceType.self)!, naverService: r.resolve(NaverServiceType.self)!)
            }
            return container
        }()
        
        let mediaContainer: Container = {
            let container = Container(parent: rootContainer)
            
            container.register(MediaReactor.self) { r in
                return MediaReactor(r.resolve(MediumServiceType.self)!, mapper: MediumMapper()) }
            return container
        }()

        
        Container.loggingFunction = nil
        defaultContainer.storyboardInitCompleted(MediaViewController.self) { r, c in
            c.reactor = mediaContainer.resolve(MediaReactor.self)
        }
//        //    root container
//        defaultContainer.register(ServiceProviderType.self) { _ in ServiceProvider() }
//        defaultContainer.register(MemoServiceType.self) { _ in MemoService() }
//        defaultContainer.register(LabelServiceType.self) { _ in LabelService() }
//        defaultContainer.register(CheckListType.self) { _ in CheckListService() }
//        defaultContainer.register(ColorThemeType.self) { _ in ColorThemeService() }
//        //    label container
//        // swiftlint:disable:next identifier_name
//        defaultContainer.register(LabelReactor.self) { r in LabelReactor(labelService: r.resolve(LabelServiceType.self)!) }
//        // swiftlint:disable:next identifier_name
//        defaultContainer.storyboardInitCompleted(LabelViewController.self) { r, c in
//            c.reactor = r.resolve(LabelReactor.self)
//        }
//        //    label container
//        // swiftlint:disable:next identifier_name
//        defaultContainer.register(AddMemoReactor.self) { r in AddMemoReactor(r.resolve(MemoServiceType.self)!) }
//        // swiftlint:disable:next identifier_name
//        defaultContainer.storyboardInitCompleted(AddMemoViewController.self) { r, c in
//            c.reactor = r.resolve(AddMemoReactor.self)
//            c.colorThemeService = r.resolve(ColorThemeType.self)
//        }
//        defaultContainer.register(MemoAttrReactor.self) { r in MemoAttrReactor(r.resolve(MemoServiceType.self)!) }
//        defaultContainer.storyboardInitCompleted(MemoAttrViewController.self) { r, c in
//            c.reactor = r.resolve(MemoAttrReactor.self)
//        }
//        defaultContainer.register(MemoListReactor.self) { r in MemoListReactor(r.resolve(MemoServiceType.self)!) }

    }
}
