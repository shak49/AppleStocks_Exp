//
//  NetworkService.swift
//  AppleStocks_Exp
//
//  Created by Shak Feizi on 8/8/22.
//

import UIKit


class NetworkService {
    static let shared = NetworkService()
    
    func getTopArticles(completion: @escaping([Article]?) -> Void) {
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else {
            fatalError("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            DispatchQueue.main.async {
                completion(articles)
            }
        }
        .resume()
    }
    
    func getStocks(completion: @escaping(([Stock]?) -> Void)) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            DispatchQueue.main.async {
                completion(stocks)
            }
        }
        .resume()
    }
}
