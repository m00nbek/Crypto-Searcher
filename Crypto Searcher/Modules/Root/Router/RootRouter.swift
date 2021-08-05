//
//  RootRouter.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

class RootRouter: RootRouterProtocol {
    static func createRoot() -> UIViewController & RootViewProtocol {
        let router: RootRouterProtocol = RootRouter()
        var view: RootViewProtocol & UIViewController = RootTabBarController()
        var presenter: RootPresenterProtcol = RootPresenter()
        var interactor: RootInteractorProtocol = RootInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        return view
    }
}
