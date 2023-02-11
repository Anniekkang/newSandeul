//
//  SearchView.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/04.
//

import UIKit
import BaseFrame

class SearchView: BaseView {
    
    let collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout { section, env -> NSCollectionLayoutSection? in
            switch sectionArray.section[section] {
            case HomeSection.First:
                return getLayoutFirstSection()
            case HomeSection.Second:
                return getLayoutFirstSection()
            case HomeSection.Third :
                return getLayoutSecondSection()
            default :
                return getLayoutSecondSection()
                
            }
        })
        view.backgroundColor = .white
        
        return view
    }()
    
    override func configure() {
        self.addSubview(collectionView)
    }
    
    override func constraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    static func getLayoutFirstSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
        
        // group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(110),
            heightDimension: .fractionalHeight(0.08)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
       return section
    }
    
    static func getLayoutSecondSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 5, bottom: 10, trailing: 5)
        
        // group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(15)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 100
        )
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        //section.orthogonalScrollingBehavior = .continuous
        return section
        
    }
    
    
}

