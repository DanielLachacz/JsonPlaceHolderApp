//
//  SceneDelegate.swift
//  JsonPlaceHolderApp
//
//  Created by Daniel Łachacz on 15/08/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let queryService = QueryService()
        let persistenceService = PersistenceService()
        let viewModel = StartViewModel(queryService: queryService, persistenceService: persistenceService)
        let listViewModel = ListViewModel(persistenceService: persistenceService)
        let startView = StartView(viewModel: viewModel, listViewModel: listViewModel)
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: startView)
        window.makeKeyAndVisible()
        self.window = window
    }
}

