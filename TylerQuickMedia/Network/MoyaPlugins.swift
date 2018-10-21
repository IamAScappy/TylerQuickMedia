//
//  MoyaPlugins.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Moya
import UIKit

let KakaoAuthPlugin = AccessTokenPlugin(tokenClosure: Enviroment.Kakao.API_KEY)

#if DEBUG
let LoggerPlugin = NetworkLoggerPlugin(verbose: true)
#else
let LoggerPlugin = ProxyPlugin()
#endif

class ProxyPlugin: PluginType { }
