//
//  HomeInteractor.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import Foundation

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtcol?
    func loadSavedCoins() -> [Coin] {
        guard let data = UserDefaults.standard.data(forKey: Constants.userDefaultsCoinsKey) else {
            // todo - handle error
            print("cannot get data from UserDefaults")
            return [Coin]()
        }
        do {
            let decodedCoins = try JSONDecoder().decode([Coin].self, from: data)
            return decodedCoins
        } catch {
            // todo - handle error
            print(error)
        }
        return [Coin]()
    }
}
