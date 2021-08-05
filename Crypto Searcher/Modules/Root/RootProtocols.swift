//
//  Protocols.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

protocol RootRouterProtocol {
    static func createRoot() -> RootViewProtocol & UITabBarController
}
protocol RootViewProtocol {
    var presenter: RootPresenterProtcol? {get set}
}
protocol RootInteractorProtocol {
    var presenter: RootPresenterProtcol? {get set}
    
}
protocol RootPresenterProtcol {
    var interactor: RootInteractorProtocol? {get set}
    var view: RootViewProtocol? {get set}
    var router: RootRouterProtocol? {get set}
}

