//
//  HeaderView.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/06.
//

import UIKit
import SnapKit

class HeaderView : UICollectionReusableView {

    let label = UILabel()
    let arrow = UIImageView()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.text = "Categories"
        label.textColor = Color.shared.Gray
        label.backgroundColor = .clear
        label.font = variousFont.mediumbold
        label.textAlignment = .left
        
        arrow.image = UIImage(named: "arrowright2")
        arrow.tintColor = Color.shared.Gray
        addSubview(stackView)
        [label, arrow].forEach {
            stackView.addSubview($0)
        }
        
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        arrow.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(arrow.snp.height)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

