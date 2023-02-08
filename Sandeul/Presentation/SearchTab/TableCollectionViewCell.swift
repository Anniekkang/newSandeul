//
//  TableCollectionViewCell.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/08.
//

import UIKit
import BaseFrame
import SnapKit

class TableCollectionViewCell: BaseCollectionViewCell {
    
  
    let Image : UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 16
//        view.layer.borderColor? = Color.shared.Gray.cgColor
//        view.layer.borderWidth = 1
        view.layer.masksToBounds = true
        return view
        
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = Color.shared.black
        label.textAlignment = .left
        label.font = variousFont.smallbold
        return label
    }()
    
    
    let altitudeLabel : UILabel = {
        let label = UILabel()
        label.textColor = Color.shared.Gray
        label.font = variousFont.smallbold
        return label
        
    }()
    
    let stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    let arrow : UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "arrowright2")
        return view
    }()
    
    override func configure() {
        [Image,stackView,arrow].forEach {
            self.addSubview($0)
        }
        [titleLabel,altitudeLabel].forEach {
            stackView.addSubview($0)
        }
    }
    
    override func constraints() {
        Image.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.9)
            make.width.equalTo(Image.snp.height)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(Image.snp.trailing).offset(10)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().multipliedBy(0.5)
            make.leading.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview()
        }
        
        altitudeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().multipliedBy(1.5)
            make.leading.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview()
        }
        
        arrow.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
            make.trailing.equalToSuperview().inset(10)
        }
        
    }
    
    
    
}
