//
//  KakaoImageResponse.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//

import Foundation

struct Meta: Decodable, Equatable {
    let total_count: Int
    let pageable_count: Int
    let is_end: Bool

    public init(total_count: Int, pageable_count: Int, is_end: Bool) {
        self.total_count = total_count
        self.pageable_count = pageable_count
        self.is_end = is_end
    }
}
extension Meta {
    static var INSTANCE_END = Meta(total_count: 0, pageable_count: 0, is_end: true)
}

struct KakaoImageResponse: Decodable, Equatable, KakaoResponsable {
    let meta: Meta
    let documents: [KakaoImage]
}

struct KakaoVClipResponse: Decodable, Equatable, KakaoResponsable {
    let meta: Meta
    let documents: [KakaoVclip]
}

protocol KakaoResponsable: MediumResponsable, Decodable {
    associatedtype Data where Data: Medium

    var meta: Meta { get }
    var documents: [Data] { get }
}

extension KakaoResponsable where Data: Medium {
    func aaa() {
    }
}

extension KakaoResponsable {
    func isEnd() -> Bool {
        return self.meta.is_end
    }
}
