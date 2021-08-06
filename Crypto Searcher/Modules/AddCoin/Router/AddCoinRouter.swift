//
//  AddCoinRouter.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/6/21.
//

import UIKit

class AddCoinRouter: AddCoinRouterProtocol {
    static func createAddCoin() -> UIViewController & AddCoinViewProtocol {
        let router: AddCoinRouterProtocol = AddCoinRouter()
        var view: UIViewController & AddCoinViewProtocol = AddCoinViewController()
        var presenter: AddCoinPresenterProtocol = AddCoinPresenter()
        var interactor: AddCoinInteractorProtocol = AddCoinInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        return view
    }
}
