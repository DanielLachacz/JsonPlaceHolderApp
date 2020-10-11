//
//  ViewController.swift
//  JsonPlaceHolderApp
//
//  Created by Daniel Łachacz on 15/08/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//

import SwiftUI

struct StartView: View {
    
    @ObservedObject var viewModel: StartViewModel
    var listViewModel: ListViewModel
    @State private var shouldAnimate = false
    
    var body: some View {

        VStack {
            if viewModel.albumsList.isEmpty == true && viewModel.usersList.isEmpty == true
            && viewModel.photosList.isEmpty == true{
                progressBar
                Text("Loading...")
            } else {
                ListView(viewModel: listViewModel)
                
            }
            
        }
    }
}

private extension StartView {
    
    var progressBar: some View {
        
        HStack {
            Circle()
                .fill(Color.red)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever())
            Circle()
            .fill(Color.red)
            .frame(width: 20, height: 20)
            .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.3))
            Circle()
            .fill(Color.red)
            .frame(width: 20, height: 20)
            .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.6))
        }
        .onAppear() {
            self.shouldAnimate = true
        }
    }
    
}

