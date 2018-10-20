import Foundation
import UIKit

protocol SwiftNameIdentifier {
    static var identifier: String { get }
}
extension SwiftNameIdentifier {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
