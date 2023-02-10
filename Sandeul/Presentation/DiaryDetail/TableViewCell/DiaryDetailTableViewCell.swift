//
//  DiaryDetailTableViewCell.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/10.
//

import UIKit
import BaseFrame
import SnapKit

class DiaryDetailTableViewCell: BaseTableViewCell {
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "title"
        label.textColor = Color.shared.Gray
        label.font = variousFont.mediumMedium
        label.textAlignment = .left
        return label
    }()
    
    let contentLabel : UILabel = {
        let label = UILabel()
        label.text = "contents"
        label.textColor = Color.shared.Green
        label.font = variousFont.smallMedium
        label.textAlignment = .right
        return label
    }()
    
    
    
    override func configure() {
        [titleLabel, contentLabel].forEach {
            self.addSubview($0)
        }
        
        
    }
    
    override func constraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.top.bottom.equalToSuperview().inset(5)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.top.bottom.equalToSuperview().inset(5)
        }
        
    }
    
}
