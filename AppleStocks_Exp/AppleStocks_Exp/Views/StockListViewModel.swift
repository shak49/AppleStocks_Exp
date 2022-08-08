//
//  StockListViewModel.swift
//  AppleStocks_Exp
//
//  Created by Shak Feizi on 8/8/22.
//

import Foundation


struct ArticleViewModel {
    let article: Article
    
    var imageURL: String {
        return self.article.imageURL
    }
    var title: String {
        return self.article.title
    }
    var publication: String {
        return self.article.publication.uppercased()
    }
}

struct StockViewModel {
    let stock: Stock
    
    var symbol: String {
        return self.stock.symbol.uppercased()
    }
    var description: String {
        return self.stock.description
    }
    var price: String {
        return String(format: "%.2f", self.stock.price)
    }
    var change: String {
        return self.stock.change
    }
}

class StockListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = []
    @Published var articles: [ArticleViewModel] = []
    
    func loadData() {
        fetchArticles()
        fetchStocks()
    }
    
    private func fetchArticles() {
        NetworkService.shared.getTopArticles { articles in
            if let articles = articles {
                DispatchQueue.main.async {
                    self.articles = articles.map(ArticleViewModel.init)
                }
            }
        }
    }
    
    private func fetchStocks() {
        NetworkService.shared.getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
}
