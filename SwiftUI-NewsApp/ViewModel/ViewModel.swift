//
//  ViewModel.swift
//  SwiftUI-NewsApp
//
//  Created by 髙津悠樹 on 2023/11/24.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    @Published var articles = [Article]()
    @Published var isLoading = false  // ロード状態の追跡
    private let newsService = NewsService()
    private var cancellables = Set<AnyCancellable>()

    func searchNews(with keyword: String) {
        isLoading = true
        newsService.fetchNews(for: keyword)
            .sink(receiveCompletion: { _ in
                self.isLoading = false
            }, receiveValue: { [weak self] response in
                self?.articles = response.articles
                self?.isLoading = false
            })
            .store(in: &cancellables)
    }
}
