//
//  BaseViewController.swift
//  BaseFrame
//
//  Created by 나리강 on 2023/02/06.
//

import UIKit

open class BaseViewController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        constraints()
        
        view.backgroundColor = .white
    }
    
    
    open func configure(){
        
    }
    
    open func constraints(){
        
    }
    

    
    
}
