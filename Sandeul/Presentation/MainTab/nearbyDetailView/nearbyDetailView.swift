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

    let label : UILabel = {
       let label = UILabel()
        label.text = "location"
        label.textColor = Color.shared.Green
        label.font = variousFont.mediumbold
        return label
    }()
    
    let collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout())
        
        return view
    }()
    
    override func configure() {
        [label, collectionView].forEach {
            self.addSubview($0)
        }
    }
    
    override func constraints() {
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().multipliedBy(0.2)
            
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(20)
        }
    }

}

extension nearbyDetailView {
    static func flowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
                let deviceWidth: CGFloat = UIScreen.main.bounds.width
                let itemWidth: CGFloat = deviceWidth / 2
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 10
                layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
                layout.scrollDirection = .vertical
                return layout
    }
    
}
