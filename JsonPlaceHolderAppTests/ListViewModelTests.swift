//
//  ListViewModelTests.swift
//  ListViewModelTests
//
//  Created by Daniel Łachacz on 30/09/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//
import XCTest
import RealmSwift
@testable import JsonPlaceHolderApp

class ListViewModelTests: XCTestCase {
    var persistenceService: PersistenceService!
    var listViewModel: ListViewModel!
    var testRealm: Realm!

    override func setUpWithError() throws {
        self.persistenceService = PersistenceService()
        self.listViewModel = ListViewModel(persistenceService: persistenceService)
        
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name

        let realm = try! Realm()
        persistenceService.realm = realm
       
    }

    override func tearDownWithError() throws {
        self.listViewModel = nil
        self.persistenceService = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_SetItemList() {
        let albums: [Album] = [Album(id: 1, userId: 1, title: "One"), Album(id: 2, userId: 2, title: "Two")]
        let photos: [Photo] = [Photo(albumId: 1, id: 1, title: "One", url: "One", thumbnailUrl: "One"), Photo(albumId: 2, id: 2, title: "Two", url: "Two", thumbnailUrl: "Two")]
        
        listViewModel.setItemList(albums: albums, photos: photos)
        
        XCTAssertEqual(listViewModel.itemsList.capacity, 2)
    }
    
    func test_GetAllAlbums() {
        let albums = [Album(id: 1, userId: 1, title: "One"), Album(id: 2, userId: 2, title: "Two")]
        try! persistenceService.addAlbums(albums: albums)
        
        let fetchAlbums = try! persistenceService.fetchAlbums()
        
        XCTAssertEqual(fetchAlbums.count, 2)
    }
    
    func test_GetAllPhotos() {
        let photos = [Photo(albumId: 1, id: 1, title: "One", url: "One", thumbnailUrl: "One"), Photo(albumId: 2, id: 2, title: "Two", url: "Two", thumbnailUrl: "Two")]
        try! persistenceService.addPhotos(photos: photos)
        
        let fetchPhotos = try! persistenceService.fetchPhotos()
        
        XCTAssertEqual(fetchPhotos.count, 2)
    }
    
    func test_GetAllUsers() {
        let users = [User(id: 1, name: "One", username: "One", email: "One", address: Address(), phone: "One", website: "One", company: Company()), User(id: 2, name: "One", username: "One", email: "One", address: Address(), phone: "One", website: "One", company: Company())]
        try! persistenceService.addUsers(users: users)
        
        let fetchUsers = try! persistenceService.fetchUsers()
        
        XCTAssertEqual(fetchUsers.count, 2)
    }

}
