//
//  nearbyDetailView.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/06.
//

import UIKit
import BaseFrame
import SnapKit

class nearbyDetailView: BaseView {

    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 5
        return view
    }()
    
    let logoImage : UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "logo")
        return view
    }()
    
    let label : UILabel = {
       let label = UILabel()
        label.text = "서울특별시"
        label.textColor = Color.shared.Gray
        label.font = variousFont.mediumbold
        label.textAlignment = .left
        return label
    }()
    
    let collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout())
        return view
    }()
    
    override func configure() {
        [stackView,collectionView].forEach {
            self.addSubview($0)
        }
        [logoImage,label].forEach {
            stackView.addSubview($0)
        }
    }
    
    override func constraints() {
        
        stackView.snp.makeConstraints { make in
            //make.leading.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(50)
           // make.width.equalToSuperview()
        }
        
        logoImage.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        label.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalTo(logoImage.snp.trailing).offset(10)
        }
        
       
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(20)
            make.top.equalTo(label.snp.bottom).offset(40)
        }
    }

}

extension nearbyDetailView {
    static func flowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
                let deviceWidth: CGFloat = UIScreen.main.bounds.width
                let itemWidth: CGFloat = deviceWidth / 2 - 30
                layout.minimumLineSpacing = 20
                layout.minimumInteritemSpacing = 10
                layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
                layout.scrollDirection = .vertical
                return layout
    }
    
}
