//
//  SecondLaunchView.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/08.
//

import UIKit
import BaseFrame
import SnapKit

class SecondLaunchView: BaseView {
    
    let logoimage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.isOpaque = true
        return view
    }()
    
    override func configure() {
        self.addSubview(logoimage)
    }
    
    override func constraints() {
        logoimage.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    
    
    
}
