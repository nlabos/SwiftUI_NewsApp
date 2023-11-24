//
//  NewsService.swift
//  SwiftUI-NewsApp
//
//  Created by 髙津悠樹 on 2023/11/24.
//　f7c46a254bc04e2f945d28ff807477af

import Combine
import SwiftUI
import Foundation

class NewsService {
    private var apiKey: String = "f7c46a254bc04e2f945d28ff807477af"
    private let baseUrl: String = "https://newsapi.org/v2/everything?apiKey="

    func fetchNews(for keyword: String) -> AnyPublisher<NewsResponse, Error> {
        guard let keywordEncoded = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "\(baseUrl)\(apiKey)&q=\(keywordEncoded)") else {
            fatalError("Invalid URL or Keyword")
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
