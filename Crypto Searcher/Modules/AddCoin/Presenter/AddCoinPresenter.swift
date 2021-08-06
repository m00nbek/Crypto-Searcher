//
//  AddCoinPresenter.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/6/21.
//

import Foundation

class AddCoinPresenter: AddCoinPresenterProtocol {
    var view: AddCoinViewProtocol?
    var interactor: AddCoinInteractorProtocol?
    var router: AddCoinRouterProtocol?
    func searchCoins(for text: String) {
        // todo - avoid force upwrapping
        let resultCoins = interactor!.searchCoins(for: text)
        view?.updateUI(with: resultCoins)
    }
    func loadCoins() {
        interactor?.loadCoins()
    }
    func saveCoin(_ coin: Coin) {
        interactor?.saveCoin(coin)
    }
}
