//
//  Constants.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import Foundation

class Constants {
    static let coinCellIdentifier = "coinCell"
    static let resultCoinCellIdentifier = "resultCoinCell"
    static let baseUrl = "https://min-api.cryptocompare.com/data"
    static let coinUrl = "\(baseUrl)/all/coinlist?summary=true"
    static let userDefaultsCoinsKey = "coins"
}
