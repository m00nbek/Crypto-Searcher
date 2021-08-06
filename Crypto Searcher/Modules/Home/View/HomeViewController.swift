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
        configureNavbar()
        configureUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let data = UserDefaults.standard.data(forKey: Constants.userDefaultsCoinsKey) else {
            // todo - handle error
            print("cannot get data from UserDefaults")
            return
        }
        do {
            let decodedCoins = try JSONDecoder().decode([Coin].self, from: data)
            self.coins = decodedCoins
        } catch {
            print(error)
        }
    }
    // MARK: - Properties
    private var coins = [Coin]() {
        didSet {
            tableView.reloadData()
        }
    }
    var presenter: HomePresenterProtcol?
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.coinCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private lazy var addButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        return button
    }()
    // MARK: - Selectors
    @objc private func addButtonTapped() {
        presenter?.showAddCoinScreen(navigationController: navigationController)
    }
    // MARK: - Functions
    private func configureUI() {
        // style
        view.backgroundColor = .white
        // tableView constraints
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    private func configureNavbar() {
        // setup plusButton
        navigationItem.setRightBarButton(addButton, animated: true)
        // setup searchBar
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.delegate = self
        navigationItem.searchController = search
    }
}
// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // search
//        coins = coins
    }
}
// MARK: - UITableViewDelegate/DataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.coinCellIdentifier, for: indexPath)
        cell.textLabel?.text = coins[indexPath.row].FullName
        return cell
    }
    
}
