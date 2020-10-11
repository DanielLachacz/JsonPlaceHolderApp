//
//  Detail.swift
//  JsonPlaceHolderApp
//
//  Created by Daniel Łachacz on 24/09/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//

import Foundation

class Detail {
    var photoId: Int = 0
    var photoTitle: String = ""
    var albumTitle: String = ""
    var username: String = ""
    var email: String = ""
    var phone: String = ""
    var url: String = ""
    
    init(photoId: Int, photoTitle: String, albumTitle: String, username: String, email: String, phone: String, url: String) {
        self.photoId = photoId
        self.photoTitle = photoTitle
        self.albumTitle = albumTitle
        self.username = username
        self.email = email
        self.phone = phone
        self.url = url
    }
}
