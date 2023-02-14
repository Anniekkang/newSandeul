//
//  SecondLaunchViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/08.
//

import UIKit
import BaseFrame
import CoreLocation

//FilterRealm VC
class SecondLaunchViewController: BaseViewController {

    static let shared = SecondLaunchViewController()
    
    let mainView = LaunchView()
    override func loadView() {
        self.view = mainView
    }
    
    var currentLongtitude : CLLocationDegrees?
    var currentLatitude : CLLocationDegrees?
    var locationManager : CLLocationManager!
    var currentLocation : String = "서울특별시"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.global().async {
            self.locationSetup()
            
            DispatchQueue.main.sync {
                MountainRepository.shared.filterRealm()
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                let sceneDelegate = windowScene?.delegate as? SceneDelegate
                sceneDelegate?.window?.rootViewController = TabbarController()
            }
        }
       
      
      
    }
    

  

}
