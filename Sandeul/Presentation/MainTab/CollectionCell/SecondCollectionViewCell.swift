//
//  SecondCollectionViewCell.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/06.
//

import UIKit
import BaseFrame
import SnapKit

class SecondCollectionViewCell: BaseCollectionViewCell {
    
    
    let ddayImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo2")
        view.backgroundColor = .white
        view.layer.borderColor = Color.shared.Gray.cgColor
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1
        return view
    }()
        
    let ddayView : UIView = {
       let view = UIView()
        view.layer.backgroundColor = (UIColor.white.cgColor).copy(alpha: 0.5)
       
        return view
    }()
    
    let ddayLabel : UILabel = {
       let label = UILabel()
        label.text = "D-Day"
        label.textColor = Color.shared.Green
        label.font = variousFont.mediumbold
        label.textAlignment = .center
        return label
    }()
    
    let titleLabel : UILabel = {
       let label = UILabel()
        label.text = "mountains"
        label.textColor = Color.shared.black
        label.textAlignment = .left
        label.font = variousFont.largebold
        return label
    }()
    
    let dateLabel : UILabel = {
       let label = UILabel()
        label.text = "2022.02.02"
        label.textColor = Color.shared.Yellow
        label.textAlignment = .left
        label.font = variousFont.smallbold
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
        [ddayImage, stackView, arrowView].forEach {
            self.addSubview($0)
        }
        ddayImage.addSubview(ddayView)
        ddayView.addSubview(ddayLabel)
        [titleLabel,dateLabel].forEach {
            stackView.addSubview($0)
        }
        
    }
    
    override func constraints() {
        ddayImage.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview().inset(10)
            make.width.equalTo(ddayImage.snp.height)
        }
        
        ddayView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        ddayLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(30)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalTo(ddayImage.snp.trailing).offset(20)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().multipliedBy(0.8)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().multipliedBy(1.4)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
            //make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        arrowView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.width.height.equalTo(20)
        }
    }
}
