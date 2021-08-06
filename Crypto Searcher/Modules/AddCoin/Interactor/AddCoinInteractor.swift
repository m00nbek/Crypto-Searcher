//
//  AddCoinInteractor.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/6/21.
//

import Foundation

class AddCoinInteractor: AddCoinInteractorProtocol {
    var coins = [Coin]()
    var presenter: AddCoinPresenterProtocol?
    
    func loadCoins() {
        let url = URL(string: Constants.coinUrl)!
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                // todo - handle error
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(CoinResponse.self, from: data)
                for coin in decodedData.Data.values {
                    self.coins.append(coin)
                }
            } catch {
                // todo - handle error
                print(error)
            }
        }.resume()
    }
    func searchCoins(for text: String) -> [Coin] {
        return filterCoins(with: text)
    }
    func filterCoins(with text: String) -> [Coin] {
        var filteredCoins = [Coin]()
        for coin in coins {
            if coin.FullName.contains(text) {
                filteredCoins.append(coin)
            }
        }
        return filteredCoins
    }
}
