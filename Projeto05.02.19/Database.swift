import Foundation

class JobCategory: NSObject, NSCoding {
    var id: Int
    var name: String
    var URLString: String
    
    init(id: Int, name: String, URLString: String) {
        self.id = id
        self.name = name
        self.URLString = URLString
    }
    
    // MARK: - NSCoding
    required init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObject(forKey: "id") as? Int ?? aDecoder.decodeInteger(forKey: "id")
        name = aDecoder.decodeObject(forKey: "name") as! String
        URLString = aDecoder.decodeObject(forKey: "URLString") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(URLString, forKey: "URLString")
    }
}

