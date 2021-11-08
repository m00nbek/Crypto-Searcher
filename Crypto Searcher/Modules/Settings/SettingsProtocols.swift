//
//  SettingsProtocols.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

protocol SettingsRouterProtocol: AnyObject {
    static func createSettings() -> SettingsViewProtocol & UIViewController
}
protocol SettingsViewProtocol: AnyObject {
    var presenter: SettingsPresenterProtcol? {get set}
}
protocol SettingsInteractorProtocol: AnyObject {
    var presenter: SettingsPresenterProtcol? {get set}
    func clearCache()
    var isDarkModeOn: Bool? {get set}
}
protocol SettingsPresenterProtcol: AnyObject {
    var interactor: SettingsInteractorProtocol? {get set}
    var view: SettingsViewProtocol? {get set}
    var router: SettingsRouterProtocol? {get set}
    func clearCache()
    var isDarkModeOn: Bool? {get set}
}
