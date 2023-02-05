//
//  OnboardViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/05.
//

import UIKit
import UIOnboarding


class OnboardViewController: UIViewController {

    let onboardingController: UIOnboardingViewController = .init(withConfiguration: .setUp())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        onboardingController.delegate = self
        navigationController?.present(onboardingController, animated: false)
        
        
       
    }
    

   
   
}

