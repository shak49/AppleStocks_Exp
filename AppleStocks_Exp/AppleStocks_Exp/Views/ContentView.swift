//
//  StocksListView.swift
//  AppleStocks_Exp
//
//  Created by Shak Feizi on 8/8/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var model = StockListViewModel()
    @State private var searchTerm: String = ""
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        model.loadData()
    }
    
    var body: some View {
        let filteredStocks = self.model.searchTerm.isEmpty ? self.model.stocks : self.model.stocks.filter {
            $0.symbol.starts(with: self.model.searchTerm)
        }
        NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                Text("January 5 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -300)
                SearchView(searchTerm: self.$model.searchTerm)
                    .offset(y: -250)
                StockListView(stocks: filteredStocks)
                    .offset(y: 100)
                ArticlesView(articles: self.model.articles)
                    .offset(y: 500)
            }
            .navigationBarTitle("Stocks")
        }
        .edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct StocksListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
