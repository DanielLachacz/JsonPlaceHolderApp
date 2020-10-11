//
//  ListViewModel.swift
//  JsonPlaceHolderApp
//
//  Created by Daniel Łachacz on 14/09/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//

import SwiftUI
import Combine

class ListViewModel: ObservableObject {
    
    private let persistenceService: PersistenceService
    
    @Published var albumsList = [Album]()
    @Published var photosList = [Photo]()
    @Published var usersList = [User]()
    @Published var itemsList = [ListItem]()
    
    init(persistenceService: PersistenceService) {
        self.persistenceService = persistenceService
        self.fetchPhotos()
    }
    
    func fetchPhotos() {
        do {
            photosList += try persistenceService.fetchPhotos()
        } catch {
            print("Error fetchPhotos ListViewModel")
        }
        
        fetchAlbums()
        fetchUsers()
        if albumsList.count > 0 && photosList.count > 0 {
            setItemList(albums: albumsList, photos: photosList)
        }
    }
    
    func fetchAlbums() {
        do {
            albumsList += try persistenceService.fetchAlbums()
        } catch {
            print("Error fetchAlbums ListViewModel")
        }
        
    }

    func fetchUsers() {
        do {
           usersList += try persistenceService.fetchUsers()
        } catch {
            print("Error fetchUsers ListViewModel")
        }
        
    }
    
    func setItemList(albums: [Album], photos: [Photo]) {
        
        if albums.count > 0 && photos.count > 0 {
            
            itemsList = photos.compactMap { photo in
                guard let album = albums.first(where: { $0.id == photo.id}) else {
                    return nil
                }
                return ListItem(id: photo.id, userId: album.userId, title: photo.title, albumTitle: album.title, thumbnailUrl: photo.thumbnailUrl)
            }
        }
        
    }

}
