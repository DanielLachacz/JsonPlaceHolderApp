//
//  StartViewModelTests.swift
//  StartViewModelTests
//
//  Created by Daniel Łachacz on 30/09/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
import RxBlocking
@testable import JsonPlaceHolderApp

class StartViewModelTests: XCTestCase {
    
    fileprivate var queryService: MockQueryService!
    var persistenceService: PersistenceService!
    var startViewModel: StartViewModel!
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    
    override func setUpWithError() throws {
        self.queryService = MockQueryService()
        self.persistenceService = PersistenceService()
        self.startViewModel = StartViewModel(queryService: queryService, persistenceService: persistenceService)
        self.scheduler = TestScheduler(initialClock: 0)
        self.disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        self.startViewModel = nil
        self.queryService = nil
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
    
    func testStartViewModel() {
       // let albums = queryService.fetchAlbums()
        let a = scheduler.createObserver([Album].self)
        let p = scheduler.createObserver([Photo].self)
        let u = scheduler.createHotObservable([.next(150, 1)]) //createObserver([User].self)
        
        startViewModel.fetchEverything()
        
        
    }

}

fileprivate class MockQueryService: QueryServiceProtocol {
    
    var albums: [Album]?
    var users: [User]?
    var photos: [Photo]?
    
    func fetchAlbums() -> Observable<[Album]> {
        if let albums = albums {
            return Observable.just(albums)
        } else {
            return Observable.error("Error" as! Error)
        }
    }
    
    func fetchUsers() -> Observable<[User]> {
        if let users = users {
            return Observable.just(users)
        } else {
            return Observable.error("Error" as! Error)
        }
        
    }
    
    func fetchPhotos() -> Observable<[Photo]> {
        if let photos = photos {
            return Observable.just(photos)
        } else {
            return Observable.error("Error" as! Error)
        }
    }
    
    
}
