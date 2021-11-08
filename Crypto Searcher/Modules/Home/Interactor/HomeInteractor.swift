//
//  HomeInteractor.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import Foundation

class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomePresenterProtcol?
    func loadSavedCoins() -> [Coin] {
        guard let data = UserDefaults.standard.data(forKey: Constants.userDefaultsCoinsKey) else {
            // todo - handle error
            print("Cannot get data from UserDefaults")
            return [Coin]()
        }
        do {
            let decodedCoins = try JSONDecoder().decode([Coin].self, from: data)
            return decodedCoins
        } catch {
            // todo - handle error
            print(error)
            return [Coin]()
        }
    }
    func searchCoin(with text: String, in coins: [Coin]) -> [Coin] {
        if text != " " && !text.isEmpty {
            return coins.filter { $0.FullName.contains(text) }
        } else {
            return presenter!.loadSavedCoins()
        }
    }
}
