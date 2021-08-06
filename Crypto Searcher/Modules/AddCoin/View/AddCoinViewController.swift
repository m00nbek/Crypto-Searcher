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
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.resultCoinCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    // MARK: - Selectors
    // MARK: - Functions
    private func configureUI() {
        // style
        view.backgroundColor = .white
        // searchBar constraints
        view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        // tableView constraints
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
// MARK: - UISearchBarDelegate
extension AddCoinViewController: UISearchBarDelegate {
    
}
// MARK: - UITableViewDelegate/DataSource
extension AddCoinViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.resultCoinCellIdentifier, for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // store the coin
    }
    
}
