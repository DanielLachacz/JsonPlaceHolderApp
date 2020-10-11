//
//  QueryService.swift
//  JsonPlaceHolderApp
//
//  Created by Daniel Łachacz on 16/08/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//

import Foundation
import RxSwift

protocol QueryServiceProtocol {
    func fetchAlbums() -> Observable<[Album]>
    func fetchUsers() -> Observable<[User]>
    func fetchPhotos() -> Observable<[Photo]>
}

class QueryService: QueryServiceProtocol {
    
    let albumsURL = URL(string: "https://jsonplaceholder.typicode.com/albums")!
    let usersURL = URL(string: "https://jsonplaceholder.typicode.com/users")!
    let photosURL = URL(string: "https://jsonplaceholder.typicode.com/photos?_limit=100")!
    var albumData: Bool!
    
    
    func fetchAlbums() -> Observable<[Album]> {
        
        return Observable.create { observer -> Disposable in
            
            let task = URLSession.shared.dataTask(with: self.albumsURL)
            { data, _, _ in
        
        guard let data = data else {
            observer.onError(NSError(domain: "", code: -1, userInfo: nil))
            return
                self.albumData = nil
        }
        
        do {
            let albums = try JSONDecoder().decode([Album].self, from: data)
            observer.onNext(albums)
        } catch {
            observer.onError(error)
        }
        }
        task.resume()
        return Disposables.create{
            task.cancel()
            }
        }
    }
    
    func fetchUsers() -> Observable<[User]> {
        
        return Observable.create { observer -> Disposable in
            
            let task = URLSession.shared.dataTask(with: self.usersURL)
            { data, _, _ in
        
        guard let data = data else {
            observer.onError(NSError(domain: "", code: -1, userInfo: nil))
            return
        }
        
        do {
            let users = try JSONDecoder().decode([User].self, from: data)
            observer.onNext(users)
        } catch {
            observer.onError(error)
        }
        }
        task.resume()
        return Disposables.create{
            task.cancel()
            }
        }
    }
    
    func fetchPhotos() -> Observable<[Photo]> {
        
        return Observable.create { observer -> Disposable in
            
            let task = URLSession.shared.dataTask(with: self.photosURL)
            { data, _, _ in
        
        guard let data = data else {
            observer.onError(NSError(domain: "", code: -1, userInfo: nil))
            return
        }
        
        do {
            let photos = try JSONDecoder().decode([Photo].self, from: data)
            observer.onNext(photos)
        } catch {
            observer.onError(error)
        }
        }
        task.resume()
        return Disposables.create{
            task.cancel()
            }
        }
    }
}
