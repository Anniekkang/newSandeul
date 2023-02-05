//
//  LoadingViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/05.
//

import UIKit
import BaseFrame

class LoadingViewController: UIViewController {
    
    let mainView = LoadingView()
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        DispatchQueue.global().async {
            guard let url = URL(string: Endpoint.mountainURL + Endpoint.thirdRequest) else { return }
            
            print(url)
            self.setParser(from: url)
            print("third parsing done")
            
            DispatchQueue.global().sync {
                guard let url = URL(string: Endpoint.mountainURL + Endpoint.fourthRequest) else { return }
                
                print(url)
                self.setParser(from: url)
                print("fourth parsing done")
                
                DispatchQueue.main.sync {
                    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                    let sceneDelegate = windowScene?.delegate as? SceneDelegate
                    sceneDelegate?.window?.rootViewController = TabbarController()
                    
                }
            }
            
            
        }
    }
    

    

}
