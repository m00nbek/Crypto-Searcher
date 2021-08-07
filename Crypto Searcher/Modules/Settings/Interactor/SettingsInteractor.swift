//
//  SettingsInteractor.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import Foundation

class SettingsInteractor: SettingsInteractorProtocol {
    var presenter: SettingsPresenterProtcol?
    
    func clearCache() {
        let encodedData = try? JSONEncoder().encode([Coin]())
        UserDefaults.standard.set(encodedData, forKey: Constants.userDefaultsCoinsKey)
    }
}
