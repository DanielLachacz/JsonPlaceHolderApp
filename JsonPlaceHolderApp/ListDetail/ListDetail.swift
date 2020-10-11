//
//  ListDetail.swift
//  JsonPlaceHolderApp
//
//  Created by Daniel Łachacz on 21/09/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ListDetail: View {
    var detail: Detail
    
    var body: some View  {
            VStack(alignment: .leading) {
    
                KFImage(URL(string: String(detail.url)))
                .resizable()
                .padding(.top, -50)
                
            Text("\(detail.photoTitle)")
                .font(.system(size: 24))
                
            Text("\(detail.albumTitle)")
                    .padding(.top, 10)
                
            Text(detail.username)
                    .padding(.top, 20)
                
            Text("\(detail.email)")
                    .padding(.top, 20)
                
            Text("\(detail.phone)")
                    .padding(.top, 20)
            }
        .padding()
    }
}
