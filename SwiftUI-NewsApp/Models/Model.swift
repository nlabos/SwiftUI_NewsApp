//
//  Model.swift
//  SwiftUI-NewsApp
//
//  Created by 髙津悠樹 on 2023/11/24.
//

import Foundation

// News APIからのレスポンスを表すモデル
struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    let id = UUID()
    let title: String
    let description: String?
    let urlToImage: String? // 画像URL
    let url: String? // ニュースのウェブページURL
}
