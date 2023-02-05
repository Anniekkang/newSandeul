//
//  LaunchViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/04.
//

import UIKit
import BaseFrame
import NVActivityIndicatorView

class LaunchViewController: BaseViewController {
    
    let indicator = NVActivityIndicatorView(frame: CGRect(x: UIScreen.main.bounds.size.width * 0.45,y:UIScreen.main.bounds.size.height * 0.8, width: 50, height: 50),type: .ballBeat,color: Color.shared.Green,padding: 0)
    
    let mainView = LaunchView()
    override func loadView() {
        self.view = mainView
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(indicator)
        indicator.startAnimating()

        
        DispatchQueue.global().async {
            guard let url = URL(string: Endpoint.mountainURL + Endpoint.firstRequest) else { return }
            
            print(url)
            self.setParser(from: url)
            print("parsing done")
            
            DispatchQueue.main.sync {
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                let sceneDelegate = windowScene?.delegate as? SceneDelegate
                let nav = UINavigationController(rootViewController: OnboardViewController())
                sceneDelegate?.window?.rootViewController = nav
            }
        }
    
        
    }
    
    
    


}

