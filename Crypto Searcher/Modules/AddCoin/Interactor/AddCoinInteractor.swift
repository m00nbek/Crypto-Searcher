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
    func saveCoin(_ coin: Coin) {
        guard let data = UserDefaults.standard.data(forKey: Constants.userDefaultsCoinsKey) else {
            // todo - handle error
            print("cannot get data from UserDefaults")
            return
        }
        if var decodedCoins = try? JSONDecoder().decode([Coin].self, from: data) {
            for decodedCoin in decodedCoins {
                if decodedCoin.Id == coin.Id {
                    return
                }
            }
            decodedCoins.append(coin)
            let encodedData = try? JSONEncoder().encode(decodedCoins)
            UserDefaults.standard.set(encodedData, forKey: Constants.userDefaultsCoinsKey)
        } else {
            print("Cannot decodee")
        }
    }
}
