//
//  RootRouter.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

class RootRouter: RootRouterProtocol {
    static func createRoot() -> UITabBarController & RootViewProtocol {
        let router: RootRouterProtocol = RootRouter()
        var view: RootViewProtocol & UITabBarController = RootTabBarController()
        var presenter: RootPresenterProtcol = RootPresenter()
        var interactor: RootInteractorProtocol = RootInteractor()
        
        let homeVC = UINavigationController(rootViewController: HomeRouter.createHome())
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        let settingsVC = UINavigationController(rootViewController: SettingsRouter.createSettings())
        settingsVC.tabBarItem.image = UIImage(systemName: "gearshape")
        
        view.presenter = presenter
        view.viewControllers = [homeVC, settingsVC]
        
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        return view
    }
}
