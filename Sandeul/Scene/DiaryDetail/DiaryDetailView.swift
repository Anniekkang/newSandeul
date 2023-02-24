//
//  DiaryDetailView.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/04.
//

import UIKit
import BaseFrame
import SnapKit

class DiaryDetailView: BaseView {

    let lineView : UIView = {
       let view = UIView()
        view.backgroundColor = Color.shared.Gray
        return view
    }()
    
    let search : UISearchController = {
        let searchController = UISearchController(searchResultsController: SearchMountainsViewController())
        searchController.searchBar.placeholder = "산 이름을 검색하시오"
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.backgroundColor = Color.shared.Gray
        //searchController.searchResultsUpdater = DiaryDetailViewController()
        searchController.searchBar.showsScopeBar = true
        return searchController
    }()
    
    
    
    let tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.backgroundColor = Color.shared.Gray

        return view
    }()

    override func configure() {
        [tableView,lineView,search.searchBar].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func constraints() {
       
        search.searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview()
        }
    
        tableView.snp.makeConstraints { make in
            make.top.equalTo(search.searchBar.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
      
    }
    
}
