//
//  SearchMountainsViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/14.
//

import UIKit
import BaseFrame

class SearchMountainsViewController: BaseViewController {

    let mainView = SearchMountainsView()
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // searchBarSetup()
    }
    
    func searchBarSetup() {
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "등록할 산 이름을 검색하시오"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
    }

    override func configure() {
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
        self.mainView.tableView.register(SearchMountainsTableViewCell.self, forCellReuseIdentifier: SearchMountainsTableViewCell.reuseIdentifier)
        
    }

}

extension SearchMountainsViewController : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
    
    
    
}

extension SearchMountainsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchMountainsTableViewCell.reuseIdentifier, for: indexPath) as? SearchMountainsTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
    
    
    
    
}
