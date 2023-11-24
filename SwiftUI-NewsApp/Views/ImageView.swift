//
//  ImageView.swift
//  SwiftUI-NewsApp
//
//  Created by 髙津悠樹 on 2023/11/24.
//

import SwiftUI

struct ImageView: View {
    let imageUrl: String

    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            } else {
                ProgressView()
            }
        }
        .frame(width: 100, height: 100)
    }
}


