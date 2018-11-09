//
//  ISO8601DateFommater.swift
//  TylerQuickMedia
//
//  Created by tskim on 02/11/2018.
//  Copyright © 2018 tskim. All rights reserved.
//

import Foundation

extension DateFormatter {
    /// kakao api refer: https://developers.kakao.com/docs/restapi/search
    //         [YYYY]-[MM]-[DD]T[hh]:[mm]:[ss].000+[tz]
    //        "2018-10-10T03:00:01.000+09:00"
    
    ///       Locales https://gist.github.com/jacobbubu/1836273
    static func iso8601Format(_ dateString: String) -> Date? {
        return _iso8601Formatter.date(from: dateString)
    }
    
//    private static let ISO8601_DATE_FORMATTER: ISO8601DateFormatter = {
//        let formatter = ISO8601DateFormatter()
//        return formatter
//    }()
    
    private static let _iso8601Formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        return formatter
    }()
//    private static let iso8601DateFormatter: DateFormatter = {
//        let formatter = ISO8601DateFormatter()
//        formatter.locale = Locale(identifier: "en_US_POSIX")
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
//        return formatter
//    }()
}
