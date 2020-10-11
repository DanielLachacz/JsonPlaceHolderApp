//
//  ListView.swift
//  JsonPlaceHolderApp
//
//  Created by Daniel Łachacz on 14/09/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ListView: View {
    
    @ObservedObject var viewModel: ListViewModel
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
        NavigationView {
            
            VStack {
            SearchBar(text: $searchText)
                .padding(.top, 10)
            
                List(viewModel.itemsList.filter({ searchText.isEmpty ? true :
                    $0.title.contains(searchText)
                })) { item in
                    NavigationLink(destination: ListDetail(detail: Detail(photoId: item.id, photoTitle: self.viewModel.photosList[item.id - 1].title, albumTitle: self.viewModel.albumsList[item.id].title, username: self.viewModel.usersList[item.userId].username, email: self.viewModel.usersList[item.userId].email, phone: self.viewModel.usersList[item.userId].phone, url: self.viewModel.photosList[item.id - 1].url))) {
                    
                    HStack {
                        
                        KFImage(URL(string: String(item.thumbnailUrl)))
                            .resizable()
                            .frame(width: 80, height: 80)
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0 ))
                    }
                    
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .padding(.top, -10)
                            .padding(.bottom, 10)
                        
                        Text(item.albumTitle)
                            .font(.system(size: 12))
                            .padding(.bottom, 0)
                        
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 20)
                }
            }
                }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
        }
    }



