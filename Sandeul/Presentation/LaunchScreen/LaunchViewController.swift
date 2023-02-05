//
//  LaunchViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/04.
//

import UIKit
import BaseFrame

class LaunchViewController: BaseViewController {

    var currentElement : String = "currentElement"
    var model : MountainModel = MountainModel()
    var models : [MountainModel] = []
    
    
    let mainView = LaunchView()
    override func loadView() {
        self.view = mainView
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        let nav = UINavigationController(rootViewController: OnboardViewController())
        sceneDelegate?.window?.rootViewController = nav
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            guard let url = URL(string: Endpoint.mountainURL + Endpoint.firstRequest)
           
            else { return }
            
            print(url)
            self.setParser(from: url)
            print("parsing done")
        }
        
        
    }
    
    
    


}
