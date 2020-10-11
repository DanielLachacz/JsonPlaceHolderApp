//
//  ListItem.swift
//  JsonPlaceHolderApp
//
//  Created by Daniel Łachacz on 20/09/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//

import Foundation

class ListItem: Identifiable {
    var id: Int = 0
    var userId: Int = 0
    var title: String = ""
    var albumTitle: String = ""
    var thumbnailUrl: String = ""
    
    
    init(id: Int, userId: Int, title: String, albumTitle: String, thumbnailUrl: String) {
        self.id = id
        self.userId = userId
        self.title = title
        self.albumTitle = albumTitle
        self.thumbnailUrl = thumbnailUrl
    }
}
