//
//  nearbyDetailViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/06.
//

import UIKit
import BaseFrame
import RealmSwift

class nearbyDetailViewController: BaseViewController {

    let realm = try! Realm()
    
    var array = globalConstant.shared.mountainImages.shuffled()
    
    let mainView = nearbyDetailView()
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.collectionView.showsVerticalScrollIndicator = false
  
    }
    

    override func configure() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(nearDetailCollectionViewCell.self, forCellWithReuseIdentifier: nearDetailCollectionViewCell.reuseIdentifier)
    }
   

}

extension nearbyDetailViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MountainRepository.shared.filteredData.count //mountains count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nearDetailCollectionViewCell.reuseIdentifier, for: indexPath) as? nearDetailCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.item < 5 {
            cell.imageView.image = UIImage(named: array[indexPath.item])
        } else  {
            cell.imageView.image = UIImage(named: array.randomElement() ?? "산1")
        }
        cell.titleLabel.text = MountainRepository.shared.filteredData[indexPath.item].title
        cell.regionLabel.text = LaunchViewController.currentLocation
        cell.heightLabel.text = "\(MountainRepository.shared.filteredData[indexPath.item].altitude)m"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        MountainRepository.shared.selectedRealm = MountainRepository.shared.filteredData[indexPath.item]
        print("selectedRealm===\(MountainRepository.shared.selectedRealm)")
        let vc = DetailViewController()
        vc.givenRealm = MountainRepository.shared.selectedRealm
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
}
