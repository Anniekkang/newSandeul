//
//  SecondLoadingViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/06.
//

import UIKit
import NVActivityIndicatorView

class SecondLoadingViewController: UIViewController {

    let indicator = NVActivityIndicatorView(frame: CGRect(x: UIScreen.main.bounds.size.width * 0.45,y:UIScreen.main.bounds.size.height * 0.8, width: 50, height: 50),type: .ballGridBeat,color: Color.shared.Green,padding: 0)
    
    let mainView = LoadingView()
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.addSubview(indicator)
        indicator.startAnimating()
        
        view.backgroundColor = .white
        
       
            
            
        
    }
    

    

}
