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
        view.image = UIImage(named: globalConstant.shared.imageName)
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "기본산"
        label.textColor = Color.shared.white
        label.font = variousFont.extraLargebold
        return label
    }()
    
    let lineView : UIView = {
       let view = UIView()
        view.backgroundColor = Color.shared.Gray
        return view
    }()
    
    let tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func configure() {
        [background, lineView, tableView].forEach {
            self.addSubview($0)
        }
        background.addSubview(titleLabel)
    }
    
    override func constraints() {
        background.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.centerY.equalToSuperview().multipliedBy(1.6)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(50)
        }
        lineView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(background.snp.bottom)
            make.height.equalTo(2)
        }
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(20)
            make.top.equalTo(lineView.snp.bottom).offset(20)
           
        }
    }
    
    
}
