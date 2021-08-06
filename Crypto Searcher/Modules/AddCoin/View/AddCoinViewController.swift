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
        presenter?.loadCoins()
    }
    // MARK: - Properties
    var presenter: AddCoinPresenterProtocol?
    var coins = [Coin]() {
        didSet {
            tableView.reloadData()
        }
    }
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
        tableView.isHidden = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private let itemNotFound: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = "Coin not found..."
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // MARK: - Selectors
    // MARK: - Protocol stubs
    func updateUI(with coins: [Coin]) {
        DispatchQueue.main.async {
            if !coins.isEmpty {
                self.itemNotFound.isHidden = true
                self.tableView.isHidden = false
                
                self.coins = coins
            } else {
                self.itemNotFound.isHidden = false
                self.tableView.isHidden = true
            }
        }
    }
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
        // itemNotFound constraints
        view.addSubview(itemNotFound)
        NSLayoutConstraint.activate([
            itemNotFound.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemNotFound.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
// MARK: - UISearchBarDelegate
extension AddCoinViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchCoins(for: searchText)
    }
}
// MARK: - UITableViewDelegate/DataSource
extension AddCoinViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.resultCoinCellIdentifier, for: indexPath)
        cell.textLabel?.text = coins[indexPath.row].FullName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // store the coin
        guard let data = UserDefaults.standard.data(forKey: Constants.userDefaultsCoinsKey) else {
            // todo - handle error
            print("cannot get data from UserDefaults")
            return
        }
        
        if var decodedCoins = try? JSONDecoder().decode([Coin].self, from: data) {
            decodedCoins.append(self.coins[indexPath.row])
            let encodedData = try? JSONEncoder().encode(decodedCoins)
            UserDefaults.standard.set(encodedData, forKey: Constants.userDefaultsCoinsKey)
        } else {
            print("Cannot decodee")
        }
    }
}
