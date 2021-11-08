//
//  Protocols.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

protocol RootRouterProtocol: AnyObject {
    static func createRoot() -> RootViewProtocol & UITabBarController
}
protocol RootViewProtocol: AnyObject {
    var presenter: RootPresenterProtcol? {get set}
}
protocol RootInteractorProtocol: AnyObject {
    var presenter: RootPresenterProtcol? {get set}
    
}
protocol RootPresenterProtcol: AnyObject {
    var interactor: RootInteractorProtocol? {get set}
    var view: RootViewProtocol? {get set}
    var router: RootRouterProtocol? {get set}
}

