//
//  User.swift
//  JsonPlaceHolderApp
//
//  Created by Daniel Łachacz on 16/08/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//

import Foundation.NSURL
import RealmSwift

class Album: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var userId: Int = 0
    @objc dynamic var title: String = ""
    
    convenience init(id: Int, userId: Int, title: String) {
        self.init()
        self.id = id
        self.userId = userId
        self.title = title
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
