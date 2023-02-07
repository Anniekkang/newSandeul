//
//  nearbyDetailViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/06.
//

import UIKit
import BaseFrame

class nearbyDetailViewController: BaseViewController {

    let mainView = nearbyDetailView()
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    override func configure() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(nearDetailCollectionViewCell.self, forCellWithReuseIdentifier: nearDetailCollectionViewCell.reuseIdentifier)
    }
   

}

extension nearbyDetailViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 //mountains count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nearDetailCollectionViewCell.reuseIdentifier, for: indexPath) as? nearDetailCollectionViewCell else { return UICollectionViewCell() }
        
        
        return cell
    }
    
    
    
    
    
    
}
