//
//  StockListViewModel.swift
//  AppleStocks_Exp
//
//  Created by Shak Feizi on 8/8/22.
//

import Foundation


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
    
    func loadData() {
        fetchStocks()
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
