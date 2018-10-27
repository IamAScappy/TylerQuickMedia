//
//  ThreadInfo.swift
//  TylerQuickMedia
//
//  Created by tskim on 2018. 10. 21..
//  Copyright © 2018년 tskim. All rights reserved.
//
import Foundation

func getThreadName() -> String {
    if Thread.isMainThread {
        return "main"
    } else {
        if let threadName = Thread.current.name, !threadName.isEmpty {
            return "\(threadName)"
        } else if let queueName = currentQueueName(), !queueName.isEmpty {
            return "\(queueName)"
        } else {
            return String(format: "%p", Thread.current)
        }
    }
}

func currentQueueName() -> String? {
    let name = __dispatch_queue_get_label(nil)
    return String(cString: name, encoding: .utf8)
}
