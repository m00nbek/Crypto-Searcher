//
//  SettingsInteractor.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

class SettingsInteractor: SettingsInteractorProtocol {
    var presenter: SettingsPresenterProtcol?
    
    var isDarkModeOn: Bool? {
        willSet {
            let window = UIApplication.shared.windows.first { $0.isKeyWindow }
            if newValue! {
                window?.overrideUserInterfaceStyle = .dark
            } else {
                window?.overrideUserInterfaceStyle = .light
            }
            UserDefaults.standard.set(newValue!, forKey: Constants.userDefaultsDarkModeKey)
        }
    }
    func clearCache() {
        let encodedData = try? JSONEncoder().encode([Coin]())
        UserDefaults.standard.set(encodedData, forKey: Constants.userDefaultsCoinsKey)
    }
}
