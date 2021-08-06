//
//  HomePresenter.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

class HomePresenter: HomePresenterProtcol {
    var interactor: HomeInteractorProtocol?
    var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
    func showAddCoinScreen(navigationController: UINavigationController?) {
        router?.showAddCoin(navigationController: navigationController)
    }
    func loadSavedCoins() -> [Coin] {
        // todo - avoid force unwrapping
        return interactor!.loadSavedCoins()
    }
}
