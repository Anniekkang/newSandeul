//
//  MainViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/03.
//

import UIKit
import BaseFrame
import SnapKit

class MainViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navDesign()
        navLogo()
    }
    
    
    func navDesign() {
        self.navigationItem.title = "Sandeul"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func navLogo() {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        self.navigationController?.navigationBar.addSubview(imageView)
    
        imageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(150)
            make.height.equalToSuperview().multipliedBy(0.6)
        }
    }
    
    

   
    
}
