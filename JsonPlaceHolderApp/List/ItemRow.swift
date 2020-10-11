//
//  ItemRow.swift
//  JsonPlaceHolderApp
//
//  Created by Daniel Łachacz on 16/09/2020.
//  Copyright © 2020 Daniel Łachacz. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var photo: Photo
    
    var body: some View {
        HStack {
            Image(photo.thumbnailUrl)
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(photo.title)
                .font(.system(size: 12))
                .lineLimit(1)
                .padding(.top, 2)
                Text(photo.url)
            }
            .padding(.leading, 10)
            .padding(.trailing, 20)
        }
    }
}
