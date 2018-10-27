//
//  JsonSerializer.swift
//  TylerQuickMediaTests
//
//  Created by tskim on 2018. 10. 27..
//  Copyright © 2018년 tskim. All rights reserved.
//
import Foundation
@testable import TylerQuickMedia

class ResourcesLoader<T: Decodable> {
    func loadJson(_ resource: String) -> T {
        let testBundle = Bundle(for: type(of: self))
        if let path = testBundle.path(forResource: resource, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                
            }
        }
        fatalError("can't decode \(T.self)")
    }
}
