//
//  SearchTableViewController.swift
//  github-search
//
//  Created by Lubomir Olshansky on 02/04/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit
import Moya




class SearchTableViewController: UITableViewController, UISearchResultsUpdating {

    
    let searchService = SearchService()
    var temp = [Base]()
     let userProvider = MoyaProvider<NetworkService>()
    var searchController: UISearchController!
    let kilo = "github"
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.hidesBarsWhenKeyboardAppears = true
        navigationController?.isNavigationBarHidden = true
        // Adding a search bar
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search users or repositories..."
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.backgroundImage = UIImage()
//        searchService.loadRepositories(searchText: searchText) { [weak self]
//            responce in
//           print(responce)
//            self?.temp = responce
//            self?.tableView?.reloadData()
//        }
//        searchService.loadUsersAndRepos(name: "ololo") { [weak self]
//                                responce in
//                                print(responce)
//                                }

    

    
  
}
    
func updateSearchResults(for searchController: UISearchController) {
            if let searchText = searchController.searchBar.text {
                if searchText.count > 2 {
                searchService.loadUsersAndRepos(name: searchText) { [weak self]
                    responce in
                    print(responce)
                    print("AAAAAAAAAAAAAAAAAAAAAAAA")
                    self?.temp = responce
                    self?.tableView?.reloadData()
                    }
        }
    }
}

    override func numberOfSections(in tableView: UITableView) -> Int {
        
          return 1
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         return temp.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "UserCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = String(temp[indexPath.row].id)
        return cell
    }
}
