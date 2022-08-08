//
//  Stock.swift
//  AppleStocks_Exp
//
//  Created by Shak Feizi on 8/8/22.
//

import UIKit


struct Stock: Codable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
