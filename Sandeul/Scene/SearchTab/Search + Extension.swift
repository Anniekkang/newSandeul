//
//  Search + Extension.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/09.
//

import UIKit
import RealmSwift

extension SearchViewController : UISearchResultsUpdating {
    
    func searchBarSetup() {
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "산 이름을 검색하시오"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        MountainRepository.shared.searchfilteredData = realm.objects(Mountain.self).where({
            $0.title.contains(text)
        })
        print(text)
        print(MountainRepository.shared.searchfilteredData)
        mainView.collectionView.reloadData()
    }
    
}







