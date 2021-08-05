//
//  HomeViewController.swift
//  Crypto Searcher
//
//  Created by Oybek on 8/5/21.
//

import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    // MARK: - Properties
    var presenter: HomePresenterProtcol?
    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = .white
    }
}

