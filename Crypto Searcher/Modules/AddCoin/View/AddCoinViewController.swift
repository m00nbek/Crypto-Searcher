//
//  AddCoinViewController.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/6/21.
//

import UIKit

class AddCoinViewController: UIViewController, AddCoinViewProtocol {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    // MARK: - Properties
    var presenter: AddCoinPresenterProtocol?
    // MARK: - Selectors
    // MARK: - Functions
    private func configureUI() {
        // style
        view.backgroundColor = .white
    }
}
