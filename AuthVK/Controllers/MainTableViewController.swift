//
//  MainViewController.swift
//  AuthVK
//
//  Created by Фарид Гулиев on 26.03.2020.
//  Copyright © 2020 Фарид Гулиев. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    //MARk: - Services
    let vkService = VKService()
    
    //MARK: - Constants
    let cellID: String = "FriendCell"
    var friends: Friends? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var user: User? {
        didSet {
            setupNavigationBar()
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    //MARK: - Load Data
    private func loadData() {
        vkService.getUsers { (user) in
            guard let user = user as? User else { return }
            self.user = user
        }
        
        vkService.getFriends { (friends) in
            guard let friends = friends as? Friends else { return }
            self.friends = friends
        }
    }
    
    //MARK: - Setup UI Elements
    private func setupNavigationBar() {
        DispatchQueue.main.async {
            self.navigationItem.title = self.user!.firstName + " " + self.user!.lastName
        }
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension MainTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends?.items.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if let friend = friends?.items[indexPath.row] {
            cell.textLabel?.text = friend.firstName
            cell.detailTextLabel?.text = friend.lastName
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
