import Foundation
import UIKit

protocol NibWithSwiftName {
    static var nib: UINib { get }
}
extension NibWithSwiftName {
    static var nib: UINib {
        return UINib(nibName: String(describing: Self.self), bundle: nil)
    }
}
