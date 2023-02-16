//
//  SearchMoiuntainsView.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/15.
//

import UIKit
import BaseFrame


class SearchMountainsView: BaseView {

    let tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        return view
    }()
    
    override func configure() {
        self.addSubview(tableView)
    }
    
    override func constraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
