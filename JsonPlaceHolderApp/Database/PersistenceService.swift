//
//  PersistenceService.swift
//  JsonPlaceHolderApp
//
//  Created by Daniel Łachacz on 09/09/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//

import RealmSwift

enum RuntimeError: Error {
    
    case NoRealmSet
}

final class PersistenceService {
    
    static let singleton = PersistenceService()
    
    var realm: Realm?
    
    
    func addAlbums(albums: [Album]) throws {
        let objects = albums.map { Album(value: $0)}
        
        do {
            realm = try Realm()
            try realm!.write {
                realm!.add(objects, update: Realm.UpdatePolicy.modified)
            }
        }
        catch RuntimeError.NoRealmSet
        {
            print("No Realm Database addAlbums PersistenceService")
        }
        catch
        {
            print("Something else went wrong with saveing the albums")
        }
    }
    
    func addPhotos(photos: [Photo]) throws {
        let objects = photos.map { Photo(value: $0)}
        
        do  {
            realm = try Realm()
            try realm!.write {
                realm!.add(objects, update:
                Realm.UpdatePolicy.modified)
            }
        }
        catch RuntimeError.NoRealmSet
        {
            print("No Realm Database addPhotos PersistenceService")
        }
        catch
        {
            print("Something else went wrong with saveing the photos")
        }
    }
    
    func addUsers(users: [User]) throws  {
        let objects = users.map { User(value: $0)}
        
        do {
            realm = try Realm()
                try realm!.write {
                    realm!.add(objects, update:
                    Realm.UpdatePolicy.modified)
                }
            }
            catch RuntimeError.NoRealmSet
            {
                print("No Realm Database addUsers PersistenceService")
            }
            catch
            {
                print("Something else went wrong with saveing the users")
        }
    }
    
    func fetchAlbums() throws -> Results<Album> {
    
        do {
            realm = try Realm()
            return realm!.objects(Album.self)
        }
        catch {
            throw RuntimeError.NoRealmSet
        }
    }
    
    func fetchPhotos() throws -> Results<Photo> {
      
        do {
            realm = try Realm()
            return realm!.objects(Photo.self)
        }
        catch {
            throw RuntimeError.NoRealmSet
        }
    }
    
    func fetchUsers() throws -> Results<User> {
       
        do {
            realm = try Realm()
            return realm!.objects(User.self)
        }
        catch {
            throw RuntimeError.NoRealmSet
        }
    }
    
}
