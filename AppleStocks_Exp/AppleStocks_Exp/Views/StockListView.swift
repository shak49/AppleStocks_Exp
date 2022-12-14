//
//  StockListView.swift
//  AppleStocks_Exp
//
//  Created by Shak Feizi on 8/8/22.
//

import SwiftUI

struct StockListView: View {
    let stocks: [StockViewModel]
    
    var body: some View {
        List(self.stocks, id: \.symbol) { stock in
            StockCellView(stock: stock)
        }
    }
}

struct StockCellView: View {
    let stock: StockViewModel
    
    var body: some View {
        return HStack {
            VStack(alignment: .leading) {
                Text(stock.symbol)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                Text(stock.description)
                    .font(.custom("Arial", size: 18))
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack {
                Text("\(stock.price)")
                    .foregroundColor(.white)
                    .font(.custom("Arial", size: 22))
                Button(stock.change) {
                    
                }
                .frame(width: 75)
                .padding(5)
                .background(.red)
                .foregroundColor(.white)
                .cornerRadius(7)
            }
        }
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        let stock = Stock(symbol: "GOOG", description: "Google Stocks", price: 1200, change: "+0.23")
        StockListView(stocks: [StockViewModel(stock: stock)])
    }
}
