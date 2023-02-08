//
//  MountainRepository.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/07.
//

import UIKit
import RealmSwift

fileprivate protocol RepositoryType : AnyObject {
    func filterRealm()
    
    
}

class MountainRepository : RepositoryType {
    
   
    
    static let shared = MountainRepository()
    
    let realm = try! Realm()
    var filteredData : Results<Mountain>!
    
    func filterRealm()  {
        
        
        filteredData = self.realm.objects(Mountain.self).where {
            $0.location.contains("\(SecondLaunchViewController.shared.currentLocation)")
        }
        
        if filteredData == nil {
            filteredData = self.realm.objects(Mountain.self).where {
                $0.location.contains("경기도")
            }
        }
        print(#function)
        print(filteredData!)
       
        
    }
   
    
    
    
    
    
    
    
    
}
