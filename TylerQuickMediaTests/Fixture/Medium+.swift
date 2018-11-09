import RealmSwift
@testable import TylerQuickMedia

extension Array where Element: Medium {
    func excludeObjectId() -> [Medium] {
        return self.map { m -> Medium in
            let temp = m
            temp.id = ""
            return temp
        }
    }
}

extension Medium {
    func equalMedia<T: Medium>(_ other: T) -> Bool {
        guard let my = self as? HasMedia else { return false }
        guard let other = other as? HasMedia else { return false }
        return my.origin == other.origin && my.thumbnail == other.thumbnail
    }
}
