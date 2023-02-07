//
//  ThirdCollectionViewCell.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/06.
//

import UIKit
import BaseFrame

class ThirdCollectionViewCell: BaseCollectionViewCell {
    
    let frameView : UIView = {
        let view = UIView()
        view.layer.borderColor = Color.shared.Gray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 16
        return view
    }()
    
    let mountainView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.layer.cornerRadius = 16
        view.layer.borderColor = Color.shared.Gray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "mountain"
        label.font = variousFont.largebold
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let heightLabel : UILabel = {
        let label = UILabel()
        label.text = "566m"
        label.font = variousFont.largebold
        label.textColor = Color.shared.Green
        label.textAlignment = .left
        return label
    }()
    
    let locationLabel : UILabel = {
        let label = UILabel()
        label.text = "Seoul"
        //  label.font = variousFont.largebold
        label.textColor = Color.shared.Gray
        label.textAlignment = .left
        return label
    }()
    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    let arrowView : UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "arrowright2")
        return view
    }()
    
    override func configure() {
        self.addSubview(frameView)
        [mountainView, stackView, arrowView].forEach {
            frameView.addSubview($0)
        }
        mountainView.addSubview(titleLabel)
        [heightLabel, locationLabel].forEach {
            stackView.addSubview($0)
        }
        
    }
    override func constraints() {
        frameView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mountainView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.35)
        }
        
        titleLabel.snp.makeConstraints { make in
        
            make.centerY.equalToSuperview().multipliedBy(1.6)
            make.width.equalToSuperview()
            make.height.equalTo(20)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalTo(mountainView.snp.trailing).offset(30)
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        
        heightLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.centerY.equalToSuperview().multipliedBy(0.9)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
            make.centerY.equalToSuperview().multipliedBy(1.3)
            
        }
        
        arrowView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
    }
}
