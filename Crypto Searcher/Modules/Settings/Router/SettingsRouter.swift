//
//  SettingsRouter.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

class SettingsRouter: SettingsRouterProtocol {
    static func createSettings() -> UIViewController & SettingsViewProtocol {
        let router: SettingsRouterProtocol = SettingsRouter()
        let view: SettingsViewProtocol & UIViewController = SettingsViewController()
        let presenter: SettingsPresenterProtcol = SettingsPresenter()
        let interactor: SettingsInteractorProtocol = SettingsInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        presenter.isDarkModeOn = UserDefaults.standard.bool(forKey: Constants.userDefaultsDarkModeKey)
        
        return view
    }
}
