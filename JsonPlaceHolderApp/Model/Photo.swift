//
//  Photo.swift
//  JsonPlaceHolderApp
//
//  Created by Daniel Łachacz on 23/08/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//

import Foundation.NSURL
import RealmSwift

class Photo: Object, Identifiable, Decodable {
    @objc dynamic var albumId: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var thumbnailUrl: String = ""
    
    convenience init(albumId: Int, id: Int, title: String, url: String, thumbnailUrl: String) {
        self.init()
        self.albumId = albumId
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
