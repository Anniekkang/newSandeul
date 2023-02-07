//
//  MainViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/03.
//

import UIKit
import BaseFrame
import SnapKit
import CoreLocation

class MainViewController: BaseViewController {
    
    
    var currentLongtitude : CLLocationDegrees?
    var currentLatitude : CLLocationDegrees?
    var currentLocation : String = "서울특별시"
    var locationManager : CLLocationManager!
    
    var array = globalConstant.shared.mountainImages.shuffled()
    
    let mainView = MainView()
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navDesign()
        locationSetup()
        
        
        
    }
    
    func locationSetup() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //권한 요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
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
        mainView.collectionView.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.reuseIdentifier)
        mainView.collectionView.register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: SecondCollectionViewCell.reuseIdentifier)
        mainView.collectionView.register(ThirdCollectionViewCell.self, forCellWithReuseIdentifier: ThirdCollectionViewCell.reuseIdentifier)
        mainView.collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")

    }

}


extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
   
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            
        case 0 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.reuseIdentifier, for: indexPath) as! FirstCollectionViewCell
            
            
            cell.imageView.image = UIImage(named: array[indexPath.item])
            
            return cell
        case 1 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCollectionViewCell.reuseIdentifier, for: indexPath) as! SecondCollectionViewCell
            return cell
        case 2 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.reuseIdentifier, for: indexPath) as! ThirdCollectionViewCell
            
            cell.mountainView.image = UIImage(named: array.randomElement() ?? "산1")
            return cell
        case 3 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.reuseIdentifier, for: indexPath) as! ThirdCollectionViewCell
            
            cell.mountainView.image = UIImage(named: array.randomElement() ?? "산2")
            return cell
        default :
            return UICollectionViewCell()
            
        }
        
    }
   
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
        if indexPath.section == 0 {
            header.label.text = "가까운 산"
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(detailMountainsAction))
            header.arrow.addGestureRecognizer(tapGesture)
            header.arrow.isUserInteractionEnabled = true
            
            
        } else if indexPath.section == 1 {
            header.label.text = "일정"
            header.arrow.isHidden = true
        } else if indexPath.section == 2{
            header.label.text = "근처에 산책하기 좋은 산"
            header.arrow.isHidden = true
        } else {
            header.label.text = "근처에 도전하기 좋은 산"
            header.arrow.isHidden = true
        }
        
        
        return header
    }
    
    
   
    @objc func detailMountainsAction() {
        
        self.navigationController?.pushViewController(nearbyDetailViewController(), animated: true)
    }
    
    
    
    
    
}

