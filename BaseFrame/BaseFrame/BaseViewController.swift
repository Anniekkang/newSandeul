//
//  BaseViewController.swift
//  BaseFrame
//
//  Created by 나리강 on 2023/02/03.
//

import UIKit

open class BaseViewController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        constraint()
       
        view.backgroundColor = .white
    }
    

    open func configure() {
        
    }
    
    open func constraint() {
        
    }
}
