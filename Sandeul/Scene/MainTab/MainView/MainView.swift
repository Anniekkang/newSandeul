//
//  MainView.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/03.
//

import UIKit
import BaseFrame

class MainView: BaseView {

    let collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout { section, env -> NSCollectionLayoutSection? in
            switch sectionArray.section[section] {
            case HomeSection.First:
                return getLayoutFirstSection()
            case HomeSection.Second:
                return getLayoutSecondSection()
            case HomeSection.Third :
                return getLayoutThirdSection()
            default :
                return getLayoutThirdSection()
                
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
            make.edges.equalToSuperview()
        }
    }
         
    static func getLayoutFirstSection() -> NSCollectionLayoutSection {
       // item
       let itemSize = NSCollectionLayoutSize(
         widthDimension: .fractionalWidth(0.5),
         heightDimension: .fractionalHeight(1.0)
       )
       let item = NSCollectionLayoutItem(layoutSize: itemSize)
       item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 10, bottom: 20, trailing: 10)
       
       // group
       let groupSize = NSCollectionLayoutSize(
         widthDimension: .fractionalWidth(0.9),
         heightDimension: .fractionalHeight(0.35)
       )
       let group = NSCollectionLayoutGroup.horizontal(
         layoutSize: groupSize,
         subitems: [item]
       )
       
       let headerSize = NSCollectionLayoutSize(
         widthDimension: .fractionalWidth(0.9),
         heightDimension: .absolute(20)
     
       )
       let header = NSCollectionLayoutBoundarySupplementaryItem(
         layoutSize: headerSize,
         elementKind: UICollectionView.elementKindSectionHeader,
         alignment: .top
       )
     
       // section
       let section = NSCollectionLayoutSection(group: group)
       section.orthogonalScrollingBehavior = .continuous
       section.boundarySupplementaryItems = [header]
        
       
       return section
         }
     
     static func getLayoutSecondSection() -> NSCollectionLayoutSection {
         // item
         let itemSize = NSCollectionLayoutSize(
           widthDimension: .fractionalWidth(1),
           heightDimension: .fractionalHeight(1)
         )
         let item = NSCollectionLayoutItem(layoutSize: itemSize)
         item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 10, bottom: 20, trailing: 10)
         
         // group
         let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
           heightDimension: .fractionalHeight(0.2)
         )
         let group = NSCollectionLayoutGroup.horizontal(
             layoutSize: groupSize,
             subitem: item,
             count: 1
         )
        
         let headerSize = NSCollectionLayoutSize(
           widthDimension: .fractionalWidth(0.9),
           heightDimension: .absolute(20)
       
         )
         let header = NSCollectionLayoutBoundarySupplementaryItem(
           layoutSize: headerSize,
           elementKind: UICollectionView.elementKindSectionHeader,
           alignment: .top
         )
       
         // section
         let section = NSCollectionLayoutSection(group: group)
         //section.orthogonalScrollingBehavior = .continuous
         section.boundarySupplementaryItems = [header]
          
          
         
         return section
         
     }
    
    static func getLayoutThirdSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1),
          heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 10, bottom: 15, trailing: 10)
        
        // group
        let groupSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1),
          heightDimension: .fractionalHeight(0.3)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 1
        )
       
        let headerSize = NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(0.9),
          heightDimension: .absolute(20)
      
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
          layoutSize: headerSize,
          elementKind: UICollectionView.elementKindSectionHeader,
          alignment: .top
        )
      
        // section
        let section = NSCollectionLayoutSection(group: group)
        //section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
         
         
        
        return section
        
    }
     
}
