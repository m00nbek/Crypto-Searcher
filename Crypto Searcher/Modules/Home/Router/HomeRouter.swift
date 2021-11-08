//
//  HomeRouter.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    func showAddCoin(navigationController: UINavigationController?) {
        let addCoinVC = AddCoinRouter.createAddCoin()
        navigationController?.pushViewController(addCoinVC, animated: true)
    }
    static func createHome() -> UIViewController & HomeViewProtocol {
        let router: HomeRouterProtocol = HomeRouter()
        let view: HomeViewProtocol & UIViewController = HomeViewController()
        let presenter: HomePresenterProtcol = HomePresenter()
        let interactor: HomeInteractorProtocol = HomeInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        return view
    }
}
