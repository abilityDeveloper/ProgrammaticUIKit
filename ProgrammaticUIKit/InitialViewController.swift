//
//  InitialViewController.swift
//  ProgrammaticUIKit
//
//  Created by Gio on 1/9/23.
//

import UIKit

class InitialViewController: UITableViewController {
    var data: [String] = ["a", "b", "c"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupTableView()
    }

    
    private func setupTableView() {
        tableView = UITableView(frame: tableView.frame, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(InitialViewController.self)")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    private func setupViewController() {
        self.title = "\(InitialViewController.self)"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape.2.fill"),
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(trailingButtonAction))
    }
    
    
    @objc func trailingButtonAction() {
        print("tbd...")
    }

}








//MARK: - UITableView
extension InitialViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(InitialViewController.self)", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
}

