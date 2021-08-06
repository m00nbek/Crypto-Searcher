//
//  File.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/6/21.
//

import Foundation

struct CoinResponse: Codable {
    let Data: [String: Coin]
}
struct Coin: Codable {
    let Id: String
    let ImageUrl: String?
    let Symbol: String
    let FullName: String
}
