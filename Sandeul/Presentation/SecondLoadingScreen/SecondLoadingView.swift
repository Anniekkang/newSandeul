//
//  SecondLoadingView.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/06.
//

import UIKit
import BaseFrame
import SnapKit

class SecondLoadingView: BaseView {

    let imageView : UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "logo2")
        view.isOpaque = true
        view.layer.opacity = 0.3
        return view
    }()
    
    override func configure() {
        self.addSubview(imageView)
    }
    
    override func constraints() {
        imageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(150)
        }
    }
   

}
