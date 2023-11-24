//
//  ContentView.swift
//  SwiftUI-NewsApp
//
//

import SwiftUI
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NewsViewModel()
    @State private var searchKeyword = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // 検索バー
                TextField("ニュースの検索キーワードを入力", text: $searchKeyword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                ZStack(alignment: .bottomTrailing) {
                    
                    
                    if viewModel.isLoading {
                        LoadingView()
                            .zIndex(1) // LoadingViewを最前面に配置
                    } else {
                        List(viewModel.articles) { article in
                            HStack {
                                // サムネイル画像
                                if let imageUrl = article.urlToImage {
                                    ImageView(imageUrl: imageUrl)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(article.title).fontWeight(.bold)
                                    
                                }
                            }
                            .onTapGesture {
                                if let url = article.url, let link = URL(string: url) {
                                    // ブラウザでURLを開く
                                    UIApplication.shared.open(link)
                                }
                            }
                        }
                    }
                    
                    if !viewModel.isLoading {
                        // サーチボタン
                        Button(action: {
                            viewModel.searchNews(with: searchKeyword)
                        }) {
                            Image(systemName: "magnifyingglass")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                        .padding([.trailing, .bottom], 20) // 右下に配置
                    }
                }
                Spacer()
                
            }
            .navigationTitle("News")
            .onTapGesture {
                // 画面をタップしたときにキーボードを閉じる
                self.hideKeyboard()
            }
        }
    }
    
    // キーボードを非表示にするメソッド
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



#Preview {
    ContentView()
}
