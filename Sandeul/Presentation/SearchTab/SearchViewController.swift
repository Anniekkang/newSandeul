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
    static let filterArray = ["가나다 순", "고도 순"]
}

class SearchViewController: BaseViewController, UISearchResultsUpdating {

    let realm = try! Realm()
    
    
    let mainView = SearchView()
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navDesign()
    }
    

    func navDesign() {
        self.navigationItem.title = "Search"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "산 이름을 검색하시오"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
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
            return 2
        case 2 :
            return 100
        default :
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
            cell.Label.text = Data.regionArray[indexPath.item]
            return cell
        case 1 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
            cell.Label.text = Data.filterArray[indexPath.item]
            return cell
        case 2 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.reuseIdentifier, for: indexPath) as? TableCollectionViewCell else { return TableCollectionViewCell() }
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(detailMountainsAction))
            cell.arrow.addGestureRecognizer(tapGesture)
            cell.arrow.isUserInteractionEnabled = true
            
            cell.Image.image = UIImage(named: "logo2")
            cell.titleLabel.text = realm.objects(Mountain.self)[indexPath.item].title
            cell.altitudeLabel.text = "\(realm.objects(Mountain.self)[indexPath.item].altitude) m"
            return cell
            
        default :
            return UICollectionViewCell()
        }
    }
    
    @objc func detailMountainsAction() {
        
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    
}
