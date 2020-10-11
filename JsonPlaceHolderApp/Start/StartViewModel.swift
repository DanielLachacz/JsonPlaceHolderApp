//
//  StartViewModel.swift
//  JsonPlaceHolderApp
//
//  Created by Daniel Łachacz on 15/08/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//

import SwiftUI
import RxSwift

class StartViewModel: ObservableObject  {
    
    @Published var albumsList = [Album]()
    @Published var usersList = [User]()
    @Published var photosList = [Photo]()
    
    let disposeBag = DisposeBag()
    private let queryService: QueryServiceProtocol
    private let persistenceService: PersistenceService

    init(queryService: QueryServiceProtocol, persistenceService:
    PersistenceService) {
        self.queryService = queryService
        self.persistenceService = persistenceService
        fetchEverything()
    }
    
    func fetchEverything() {
        Observable.zip(queryService.fetchAlbums(), queryService.fetchUsers(), queryService.fetchPhotos())
            .subscribe(onNext: { (albums, users, photos) in
                DispatchQueue.main.async {
                    self.albumsList += albums
                    self.usersList += users
                    self.photosList += photos
                    
                    do {
                        try self.persistenceService.addAlbums(albums: albums)
                    }
                    catch {
                        print("Error addAlbums StartViewModel")
                    }
                    
                    do {
                        try self.persistenceService.addPhotos(photos: photos)
                    }
                    catch {
                        print("Error addPhotos StartViewModel")
                    }
                   
                    do {
                        try self.persistenceService
                            .addUsers(users: users)
                    }
                    catch {
                        print("Error addUsers StartViewModel")
                    }
                   
                }
            })
            .disposed(by: self.disposeBag)
    }
}
