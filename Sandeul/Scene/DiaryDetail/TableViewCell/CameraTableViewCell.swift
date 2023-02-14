//
//  CameraTableViewCell.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/10.
//

import UIKit
import BaseFrame
import SnapKit

class CameraTableViewCell: BaseTableViewCell {
    
    let cameraView : UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    let cameraImage : UIImageView = {
        let image = UIImageView()
        let cameraImage = UIImage(named: "camera")!.withTintColor(Color.shared.Green)
        image.image = cameraImage
        return image
    }()
    
    override func configure() {
        self.addSubview(cameraView)
        cameraView.addSubview(cameraImage)
    }
    
    override func constraints() {
        
        cameraView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        cameraImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.1)
            make.height.equalTo(cameraImage.snp.width)
        }
        
    }
    
}
