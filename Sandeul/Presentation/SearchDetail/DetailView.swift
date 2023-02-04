//
//  DetailView.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/04.
//

import UIKit
import BaseFrame

class DetailView: BaseView {
    
    let background : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        return view
    }()
    
    let lineView : UIView = {
       let view = UIView()
        return view
    }()
    
    let tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        return view
    }()
    
    override func configure() {
        
    }
    
    override func constraints() {
        
    }
    
    
}
