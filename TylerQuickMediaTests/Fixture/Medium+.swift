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
