//
//  MainViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/03.
//

import UIKit
import BaseFrame
import SnapKit
import RealmSwift
import CoreLocation

class MainViewController: BaseViewController {
    
    
    let realm = try! Realm()
    
    var array = globalConstant.shared.mountainImages.shuffled()
    
    
    let mainView = MainView()
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navDesign()
        
    }
    
    
    
    func navDesign() {
        self.navigationItem.title = "Sandeul"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //Not use
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
            if MountainRepository.shared.filteredData.count < 5 {
                return MountainRepository.shared.filteredData.count
            } else {
                return 5
            }
            
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        MountainRepository.shared.filteredData = MountainRepository.shared.filteredData.sorted(byKeyPath: "altitude", ascending: true)
        switch indexPath.section {
            //near Mountains
        case 0 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.reuseIdentifier, for: indexPath) as! FirstCollectionViewCell
            
            cell.imageView.image = UIImage(named: array[indexPath.item])
            cell.titleLabel.text = MountainRepository.shared.filteredData[indexPath.item].title
            cell.heightLabel.text = "\(MountainRepository.shared.filteredData[indexPath.item].altitude) m"
            cell.regionLabel.text = LaunchViewController.currentLocation
            
            return cell
            
            //D-Day
        case 1 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCollectionViewCell.reuseIdentifier, for: indexPath) as! SecondCollectionViewCell
            return cell
            
            //Recommend a lower mountain nearby
        case 2 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.reuseIdentifier, for: indexPath) as! ThirdCollectionViewCell
            
            var lowerMountains = MountainRepository.shared.filteredData.filter { Int($0.altitude)! < 1000 }
            
            if lowerMountains.isEmpty {
                lowerMountains =  MountainRepository.shared.filteredData.filter { Int($0.altitude)! > 1000 }
                
            }
            cell.titleLabel.text = lowerMountains.first?.title
            cell.locationLabel.text = LaunchViewController.currentLocation
            cell.heightLabel.text = "\(lowerMountains.first?.altitude ?? "확인불가능") m"
            cell.mountainView.image = UIImage(named: array[4])
            
            
            
            return cell
            
            //Recommend a highest mountain nearby
        case 3 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.reuseIdentifier, for: indexPath) as! ThirdCollectionViewCell
            
            var highestMountains = MountainRepository.shared.filteredData.filter { Int($0.altitude)! > 1000 }
            
            
            if highestMountains.isEmpty {
                highestMountains =  MountainRepository.shared.filteredData.filter { Int($0.altitude)! < 1000 }
            }
                cell.titleLabel.text = highestMountains.last?.title
                cell.locationLabel.text = LaunchViewController.currentLocation
                cell.heightLabel.text = "\(highestMountains.last!.altitude) m"
                cell.mountainView.image = UIImage(named: array[5])
            
            
            
            
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
            header.label.text = "근처에 낮은 산"
            header.arrow.isHidden = true
        } else {
            header.label.text = "근처에 높은 산"
            header.arrow.isHidden = true
        }
        
        
        return header
    }
    
    
    
    @objc func detailMountainsAction() {
        
        self.navigationController?.pushViewController(nearbyDetailViewController(), animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            MountainRepository.shared.selectedRealm = MountainRepository.shared.filteredData[indexPath.item]
            let vc = DetailViewController()
            vc.givenRealm = MountainRepository.shared.selectedRealm
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.section == 1 {
            
            
            
        } else if indexPath.section == 2 {
            MountainRepository.shared.selectedRealm = MountainRepository.shared.filteredData.first
            let vc = DetailViewController()
            vc.givenRealm = MountainRepository.shared.selectedRealm
            print("givenRealm======\(vc.givenRealm)")
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        } else {
            MountainRepository.shared.selectedRealm = MountainRepository.shared.filteredData.last
            let vc = DetailViewController()
            vc.givenRealm = MountainRepository.shared.selectedRealm
            print("givenRealm======\(vc.givenRealm)")
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    
}

