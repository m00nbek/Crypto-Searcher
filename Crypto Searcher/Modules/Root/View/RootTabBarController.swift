//
//  RootTabBarController.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

class RootTabBarController: UITabBarController, RootViewProtocol {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    // MARK: - Properties
    var presenter: RootPresenterProtcol?
    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
}
