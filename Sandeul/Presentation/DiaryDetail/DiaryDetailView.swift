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
    
    let searchBar : UISearchBar = {
       let bar = UISearchBar()
        bar.placeholder = "일정을 등록할 산 이름을 검색하세요"
        bar.searchBarStyle = .minimal
        bar.keyboardType = .namePhonePad
        bar.searchTextField.backgroundColor = Color.shared.white
        bar.searchTextField.textColor = Color.shared.Green
        bar.isTranslucent = false
        bar.sizeToFit()
        
        return bar
    }()
    
    
    let tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.backgroundColor = Color.shared.Gray

        return view
    }()

    override func configure() {
        [tableView,lineView,searchBar].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func constraints() {
       
        lineView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
        }
        
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(10)
        }
     
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
      
    }
    
}
