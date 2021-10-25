//
//  AddCoinPresenter.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/6/21.
//

import Foundation

class AddCoinPresenter: AddCoinPresenterProtocol {
    weak var view: AddCoinViewProtocol?
    var interactor: AddCoinInteractorProtocol?
    var router: AddCoinRouterProtocol?
    func searchCoins(for text: String) {
        // todo - avoid force upwrapping
        Task.init {
            let coins = await interactor!.searchCoins(for: text)
            DispatchQueue.main.async {
                self.view?.updateUI(with: coins)
            }
        }
    }
    func loadCoins() {
        Task.init {
            await interactor?.loadCoins()
        }
    }
    func saveCoin(_ coin: Coin) -> String {
        return interactor!.saveCoin(coin)
    }
}
