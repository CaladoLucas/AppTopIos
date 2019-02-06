import Foundation

class Database {
    
    static let shared = Database()
    var storage:Array<String> = []
    
    private init(){}
    
    func insert(add value: String) {
        self.storage.append(value)
    }
    
    func delete(add value: String) {
        if let index = self.storage.firstIndex(of: value) {
            self.storage.remove(at: index)
        }
    }
    
    func list() -> Array<String>{
        return self.storage
    }
    
    static func instance() -> Database {
        return self.shared
    }
}
