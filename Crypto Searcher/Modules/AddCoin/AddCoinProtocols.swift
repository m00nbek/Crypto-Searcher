//
//  AddCoinProtocols.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/6/21.
//

import UIKit

protocol AddCoinViewProtocol: AnyObject {
    var presenter: AddCoinPresenterProtocol? {get set}
    func updateUI(with coins: [Coin])
}
protocol AddCoinInteractorProtocol: AnyObject {
    var presenter: AddCoinPresenterProtocol? {get set}
    func searchCoins(for text: String) async -> [Coin]
    func loadCoins() async
    func saveCoin(_ coin: Coin) -> String
}
protocol AddCoinPresenterProtocol: AnyObject {
    var view: AddCoinViewProtocol? {get set}
    var interactor: AddCoinInteractorProtocol? {get set}
    var router: AddCoinRouterProtocol? {get set}

    func searchCoins(for text: String)
    func saveCoin(_ coin: Coin) -> String
}
protocol AddCoinRouterProtocol: AnyObject {
    static func createAddCoin() -> UIViewController & AddCoinViewProtocol
}
