//
//  SearchCollectionViewCell.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/08.
//

import UIKit
import BaseFrame
import SnapKit

class SearchCollectionViewCell: BaseCollectionViewCell {
    
    let view : UIView = {
       let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.borderColor = Color.shared.Gray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let Label : UILabel = {
       let label = UILabel()
        label.text = "All"
        label.textColor = Color.shared.Gray
        label.textAlignment = .center
        return label
    }()
    
    override func configure() {
        self.addSubview(view)
        view.addSubview(Label)
    }
    
    override func constraints() {
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        Label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
