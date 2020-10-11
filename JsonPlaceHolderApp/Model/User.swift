//
//  User.swift
//  JsonPlaceHolderApp
//
//  Created by Daniel Łachacz on 23/08/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//

import Foundation.NSURL
import RealmSwift

class User: Object, Identifiable, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var username: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var address: Address?
    @objc dynamic var phone: String = ""
    @objc dynamic var website: String = ""
    @objc dynamic var company: Company?
    
    convenience init(id: Int, name: String, username: String, email: String, address: Address, phone: String, website: String, company: Company) {
        self.init()
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Address: Object, Decodable {
    @objc dynamic var street: String = ""
    @objc dynamic var suite: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var zipcode: String = ""
    @objc dynamic var geo: Geo?
}

class Geo: Object, Decodable {
    @objc dynamic var lat: String = ""
    @objc dynamic var lng: String = ""
}

class Company: Object, Decodable {
    @objc dynamic var name: String = ""
    @objc dynamic var catchPhrase: String = ""
    @objc dynamic var bs: String = ""
}
