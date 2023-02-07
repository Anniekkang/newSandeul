//
//  FirstCollectionViewCell.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/06.
//

import UIKit
import BaseFrame

class FirstCollectionViewCell: BaseCollectionViewCell {
    
    let imageView : UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.image = UIImage(named: "logo")
        view.layer.cornerRadius = 16
        view.layer.borderColor = Color.shared.Gray.cgColor
        view.layer.borderWidth = 1
        
        
        return view
    }()
    
    let backGroundView : UIView = {
        let view = UIView()
        view.layer.backgroundColor = (UIColor.white.cgColor).copy(alpha: 0.5)
       
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "기본산"
        label.textColor = .black
        label.textAlignment = .center
        label.font = variousFont.extraLargebold
        return label
    }()
    
    let heightLabel : UILabel = {
        let label = UILabel()
        label.text = "height"
        label.textColor = Color.shared.Gray
        label.textAlignment = .center
        label.font = variousFont.smallbold

        
        return label
    }()
    
    let regionLabel : UILabel = {
        let label = UILabel()
        label.textColor = Color.shared.Green
        label.textAlignment = .center
        label.text = "위치"
        label.font = variousFont.smallbold
        return label
    }()
    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 5
        view.distribution = .fillEqually
        return view
    }()
    
 
    
    override func configure() {
        self.addSubview(imageView)
        imageView.addSubview(backGroundView)
        backGroundView.addSubview(stackView)
        [titleLabel,heightLabel,regionLabel].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    override func constraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        
        backGroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(20)
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
            
        }
        
        heightLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(stackView.spacing)
            make.width.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
           
            
        }
        
        regionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
            make.top.equalTo(heightLabel.snp.bottom).offset(5)
        }
    }
    
    
}
