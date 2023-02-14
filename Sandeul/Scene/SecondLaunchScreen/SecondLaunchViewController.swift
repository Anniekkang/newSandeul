//
//  SecondLaunchViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/08.
//

import UIKit
import BaseFrame


//FilterRealm VC
class SecondLaunchViewController: BaseViewController {

    
    let mainView = LaunchView()
    override func loadView() {
        self.view = mainView
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MountainRepository.shared.filterRealm()
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        sceneDelegate?.window?.rootViewController = TabbarController()
    
    }
    
    
    
    
}
