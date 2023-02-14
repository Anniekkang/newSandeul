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
    
    let mainView = MainView()
    override func loadView() {
        self.view = mainView
    }
    
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
    
    override func configure() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
//        mainView.collectionView.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.reuseIdentifier)
//        mainView.collectionView.register(ElseCollectionViewCell.self, forCellWithReuseIdentifier: ElseCollectionViewCell.reuseIdentifier)
//
    }

   
    
}

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        } else
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
    
    
}

