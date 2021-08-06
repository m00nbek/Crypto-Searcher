//
//  AddCoinProtocols.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/6/21.
//

import UIKit

protocol AddCoinViewProtocol {
    var presenter: AddCoinPresenterProtocol? {get set}
    func updateUI(with coins: [Coin])
}
protocol AddCoinInteractorProtocol {
    var presenter: AddCoinPresenterProtocol? {get set}
    func searchCoins(for text: String) -> [Coin]
    func loadCoins()
    func saveCoin(_ coin: Coin)
}
protocol AddCoinPresenterProtocol {
    var view: AddCoinViewProtocol? {get set}
    var interactor: AddCoinInteractorProtocol? {get set}
    var router: AddCoinRouterProtocol? {get set}

    func searchCoins(for text: String)
    func loadCoins()
    func saveCoin(_ coin: Coin)
}
protocol AddCoinRouterProtocol {
    static func createAddCoin() -> UIViewController & AddCoinViewProtocol
}
