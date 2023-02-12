//
//  SearchViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/03.
//

import UIKit
import BaseFrame
import RealmSwift


enum Data {
    static let regionArray = ["All","강원도", "경기도", "서울특별시", "경상남도", "경상북도", "대구광역시", "부산광역시", "울산광역시", "인천광역시", "전라남도", "전라북도", "제주도", "충청남도", "충청북도"]
    static let filterArray = ["가나다 순", "고도 높은 순", "고도 낮은 순"]
}


class SearchViewController: BaseViewController {
    
    var previousSelectedIndexPath : IndexPath? = nil
    var lastSelectedIndexPath : IndexPath? = nil
    var regionFiltered : Results<Mountain> = MountainRepository.shared.regionFilteredData
    
    let realm = try! Realm()
    
    let mainView = SearchView()
    override func loadView() {
        self.view = mainView
    }
    
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        
        return isActive && isSearchBarHasText
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        navDesign()
        searchBarSetup()
        mainView.collectionView.allowsMultipleSelection = true
//        mainView.collectionView.cellForItem(at: [0,0])?.isSelected = true
//        mainView.collectionView.cellForItem(at: [1,0])?.isSelected = true
    }
    
    
    func navDesign() {
        self.navigationItem.title = "Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    
    override func configure() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.reuseIdentifier)
        mainView.collectionView.register(TableCollectionViewCell.self, forCellWithReuseIdentifier: TableCollectionViewCell.reuseIdentifier)
    }
    
    
}

extension SearchViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return Data.regionArray.count
        case 1 :
            return 3
        case 2 :
            return isFiltering ? MountainRepository.shared.searchfilteredData.count : regionFiltered.count
        default :
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        
        switch indexPath.section {
            //region filter
        case 0 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
            cell.Label.text = Data.regionArray[indexPath.item]
            return cell
            
            //three options filter
        case 1 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
            cell.Label.text = Data.filterArray[indexPath.item]
            
            return cell
            
            //mountainList
        case 2 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.reuseIdentifier, for: indexPath) as? TableCollectionViewCell else { return TableCollectionViewCell() }
            
            cell.Image.image = UIImage(named: "logo2")
            cell.titleLabel.text = regionFiltered[indexPath.item].title
            cell.altitudeLabel.text = "\(regionFiltered[indexPath.item].altitude) m"
            
//            if isFiltering {
//                cell.titleLabel.text = MountainRepository.shared.searchfilteredData[indexPath.item].title
//                cell.altitudeLabel.text = "\(MountainRepository.shared.searchfilteredData[indexPath.item].altitude) m"
//            } else {
//                
//                
//            }
//            
            return cell
            
        default :
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        
        if indexPath.section == 2 {
            if isFiltering {
                MountainRepository.shared.selectedprimaryKey = MountainRepository.shared.searchfilteredData[indexPath.item].objectId
            } else {
                MountainRepository.shared.selectedprimaryKey = realm.objects(Mountain.self)[indexPath.item].objectId
            }
            
            MountainRepository.shared.selectedRealm = realm.objects(Mountain.self).where({
                $0.objectId ==  MountainRepository.shared.selectedprimaryKey!
            }).first
            
            print(MountainRepository.shared.selectedprimaryKey!)
            let vc = DetailViewController()
            vc.givenRealm = MountainRepository.shared.selectedRealm
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.section == 0 {
           // collectionView.deselectItem(at: [0,0], animated: true)
            
            if previousSelectedIndexPath != nil {
                collectionView.deselectItem(at: previousSelectedIndexPath!, animated: true)
            }
            let selectedCell = collectionView.cellForItem(at: indexPath)!
            selectedCell.isSelected = true
            previousSelectedIndexPath = indexPath
            
            
            if indexPath.item == 0 {
                MountainRepository.shared.regionFilteredData = realm.objects(Mountain.self)
            } else {
                var selectRegion = Data.regionArray[indexPath.item]
                regionFiltered = realm.objects(Mountain.self).where {
                    $0.location.contains(selectRegion)
                }
                print("regionFiltered=== \(String(describing: regionFiltered))")
                collectionView.reloadSections(IndexSet(2...2))
            }
            
            
            
            
            
            
        } else {
            guard collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseIdentifier, for: indexPath) is SearchCollectionViewCell else { return }
            
          //  collectionView.deselectItem(at: [1,0], animated: true)
            if lastSelectedIndexPath != nil {
                collectionView.deselectItem(at: lastSelectedIndexPath!, animated: true)
            }
            let selectedCell = collectionView.cellForItem(at: indexPath)!
            selectedCell.isSelected = true
            lastSelectedIndexPath = indexPath
            
        }
        
    }
    

}
