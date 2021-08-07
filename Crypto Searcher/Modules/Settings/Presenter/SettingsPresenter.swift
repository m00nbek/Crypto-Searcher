//
//  SettingsPresenter.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import Foundation

class SettingsPresenter: SettingsPresenterProtcol {
    var interactor: SettingsInteractorProtocol?
    var view: SettingsViewProtocol?
    var router: SettingsRouterProtocol?
    
    var isDarkModeOn: Bool? {
        willSet {
            interactor?.isDarkModeOn = newValue!
        }
    }
    func clearCache() {
        interactor?.clearCache()
    }
}
