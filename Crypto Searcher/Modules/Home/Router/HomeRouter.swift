//
//  HomeRouter.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    static func createHome() -> UIViewController & HomeViewProtocol {
        let router: HomeRouterProtocol = HomeRouter()
        var view: HomeViewProtocol & UIViewController = HomeViewController()
        var presenter: HomePresenterProtcol = HomePresenter()
        var interactor: HomeInteractorProtocol = HomeInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        return view
    }
}
