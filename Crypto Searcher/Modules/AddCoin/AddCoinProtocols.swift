//
//  AddCoinProtocols.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/6/21.
//

import UIKit

protocol AddCoinViewProtocol {
    var presenter: AddCoinPresenterProtocol? {get set}
}
protocol AddCoinInteractorProtocol {
    var presenter: AddCoinPresenterProtocol? {get set}
}
protocol AddCoinPresenterProtocol {
    var view: AddCoinViewProtocol? {get set}
    var interactor: AddCoinInteractorProtocol? {get set}
    var router: AddCoinRouterProtocol? {get set}
}
protocol AddCoinRouterProtocol {
    static func createAddCoin() -> UIViewController & AddCoinViewProtocol
}
