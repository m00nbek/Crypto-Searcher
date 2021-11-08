//
//  HomeProtocols.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

protocol HomeRouterProtocol: AnyObject {
    static func createHome() -> HomeViewProtocol & UIViewController
    func showAddCoin(navigationController: UINavigationController?) 
}
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtcol? {get set}
}
protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtcol? {get set}
    func loadSavedCoins() -> [Coin]
    func searchCoin(with text: String, in coins: [Coin]) -> [Coin]
}
protocol HomePresenterProtcol: AnyObject {
    var interactor: HomeInteractorProtocol? {get set}
    var view: HomeViewProtocol? {get set}
    var router: HomeRouterProtocol? {get set}
    func showAddCoinScreen(navigationController: UINavigationController?)
    func loadSavedCoins() -> [Coin]
    func searchCoin(with text: String, in coins: [Coin]) -> [Coin]
}
