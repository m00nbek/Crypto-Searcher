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
        configureNavBar()
    }
    // MARK: - Properties
    var presenter: SettingsPresenterProtcol?
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.settingsCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private lazy var darkModeSwitcher: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = presenter!.isDarkModeOn!
        switcher.addTarget(self, action: #selector(switchDarkMode), for: .valueChanged)
        return switcher
    }()
    private lazy var clearCacheAlert: UIAlertController = {
        let alertController = UIAlertController(title: "Are you sure to delete all of the saved coins?", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
            self.presenter?.clearCache()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        return alertController
    }()
    // MARK: - Selectors
    @objc private func switchDarkMode() {
        presenter?.isDarkModeOn = darkModeSwitcher.isOn
    }
    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = .systemBackground
        // tableView constraints
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    private func configureNavBar() {
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
// MARK: - UITableViewDelegate/DataSource
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 2 cells for each section
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Contact"
        } else {
            return ""
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.settingsCellIdentifier, for: indexPath)
            cell.textLabel?.text = "Clear cache"
            cell.textLabel?.textColor = .systemRed
            cell.textLabel?.textAlignment = .center
            return cell
        } else if indexPath.section == 0 && indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.settingsCellIdentifier, for: indexPath)
            cell.textLabel?.text = "Dark mode"
            cell.accessoryView = darkModeSwitcher
            return cell
        } else if indexPath.section == 1 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.settingsCellIdentifier, for: indexPath)
            cell.textLabel?.text = "Mail"
            cell.textLabel?.textAlignment = .center
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.settingsCellIdentifier, for: indexPath)
            cell.textLabel?.text = "Phone"
            cell.textLabel?.textAlignment = .center
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 && indexPath.row == 0 {
            // show alert
            present(clearCacheAlert, animated: true)
        } else if indexPath.section == 0 && indexPath.row == 1 {
            // switch dark mode
            darkModeSwitcher.setOn(!darkModeSwitcher.isOn, animated: true)
            switchDarkMode()
        } else if indexPath.section == 1 && indexPath.row == 0 {
            // email
            if let url = URL(string: "mailto:\(Constants.mail)") {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:])
                }
            }
        } else {
            // phone number
            if let url = URL(string: "tel://\(Constants.phoneNumber)") {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:])
                }
            }
        }
    }
}
