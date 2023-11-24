//
//  LoadingView.swift
//  SwiftUI-NewsApp
//
//  Created by 髙津悠樹 on 2023/11/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView("ニュースを検索中...")
            
        }
    }
}

#Preview {
    LoadingView()
}
