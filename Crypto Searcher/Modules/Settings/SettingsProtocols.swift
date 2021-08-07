//
//  SettingsProtocols.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

protocol SettingsRouterProtocol {
    static func createSettings() -> SettingsViewProtocol & UIViewController
}
protocol SettingsViewProtocol {
    var presenter: SettingsPresenterProtcol? {get set}
}
protocol SettingsInteractorProtocol {
    var presenter: SettingsPresenterProtcol? {get set}
    func clearCache()
}
protocol SettingsPresenterProtcol {
    var interactor: SettingsInteractorProtocol? {get set}
    var view: SettingsViewProtocol? {get set}
    var router: SettingsRouterProtocol? {get set}
    func clearCache()
}
