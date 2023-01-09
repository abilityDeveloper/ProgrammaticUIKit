//
//  InitialViewController.swift
//  ProgrammaticUIKit
//
//  Created by Gio on 1/9/23.
//

import UIKit

class InitialViewController: UIViewController {
//    let tableView = UITableView(frame: .zero, style: .grouped)
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
        return tableView
    }()
    
    var safeArea = UILayoutGuide()
    
    var data: [String] = ["a", "b", "c"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Homepage"
        view.backgroundColor = .systemGroupedBackground
        safeArea = view.layoutMarginsGuide
        setupTableView()
    }

    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(InitialViewController.self)")
        tableView.dataSource = self
        tableView.delegate = self
    }

}


//MARK: -
extension InitialViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(InitialViewController.self)", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
}

