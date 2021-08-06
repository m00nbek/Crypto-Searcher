//
//  HomeProtocols.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

protocol HomeRouterProtocol {
    static func createHome() -> HomeViewProtocol & UIViewController
    func showAddCoin(navigationController: UINavigationController?) 
}
protocol HomeViewProtocol {
    var presenter: HomePresenterProtcol? {get set}
}
protocol HomeInteractorProtocol {
    var presenter: HomePresenterProtcol? {get set}
    func loadSavedCoins() -> [Coin]
}
protocol HomePresenterProtcol {
    var interactor: HomeInteractorProtocol? {get set}
    var view: HomeViewProtocol? {get set}
    var router: HomeRouterProtocol? {get set}
    func showAddCoinScreen(navigationController: UINavigationController?)
    func loadSavedCoins() -> [Coin]
}
