//
//  AddCoinInteractor.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/6/21.
//

import Foundation

class AddCoinInteractor: AddCoinInteractorProtocol {
    var coins = [Coin]()
    weak var presenter: AddCoinPresenterProtocol?
    
    func loadCoins() async {
        let url = URL(string: Constants.coinUrl)!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(CoinResponse.self, from: data)
            for coin in decodedData.Data.values {
                self.coins.append(coin)
            }
        } catch {
            // todo - handle error
            print(error)
        }
    }
    func searchCoins(for text: String) async -> [Coin] {
        if coins.isEmpty {
            await loadCoins()
        }
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
    func saveCoin(_ coin: Coin) -> String {
        guard let data = UserDefaults.standard.data(forKey: Constants.userDefaultsCoinsKey) else {
            // todo - handle error
            print("cannot get data from UserDefaults")
            return "Error"
        }
        if var decodedCoins = try? JSONDecoder().decode([Coin].self, from: data) {
            for decodedCoin in decodedCoins {
                if decodedCoin.Id == coin.Id {
                    return "Coin already saved"
                }
            }
            decodedCoins.append(coin)
            let encodedData = try? JSONEncoder().encode(decodedCoins)
            UserDefaults.standard.set(encodedData, forKey: Constants.userDefaultsCoinsKey)
            return "Coin saved successfully!"
        } else {
            // todo - handle error
            return "Error"
        }
    }
}
