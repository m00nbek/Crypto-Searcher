//
//  SettingsViewController.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

class SettingsViewController: UIViewController, SettingsViewProtocol {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    // MARK: - Properties
    var presenter: SettingsPresenterProtcol?
    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = .white
    }
}
