//
//  NetworkService.swift
//  AppleStocks_Exp
//
//  Created by Shak Feizi on 8/8/22.
//

import UIKit


class NetworkService {
    static let shared = NetworkService()
    
    func getStocks(completion: @escaping(([Stock]?) -> Void)) {
        guard let url = URL(string: "https://silicon-rhinoceros.glitch.me/stocks") else {
            fatalError("")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks)
        }
        .resume()
    }
}
