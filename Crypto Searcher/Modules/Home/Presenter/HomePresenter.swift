//
//  HomePresenter.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

class HomePresenter: HomePresenterProtcol {
    weak var interactor: HomeInteractorProtocol?
    weak var view: HomeViewProtocol?
    weak var router: HomeRouterProtocol?
    func showAddCoinScreen(navigationController: UINavigationController?) {
        router?.showAddCoin(navigationController: navigationController)
    }
    func loadSavedCoins() -> [Coin] {
        // todo - avoid force unwrapping
        return interactor!.loadSavedCoins()
    }
    func searchCoin(with text: String, in coins: [Coin]) -> [Coin] {
        return interactor!.searchCoin(with: text, in: coins)
    }
}
