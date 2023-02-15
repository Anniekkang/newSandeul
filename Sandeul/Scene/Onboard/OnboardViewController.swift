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

extension OnboardViewController: UIOnboardingViewControllerDelegate {
    
    func didFinishOnboarding(onboardingViewController: UIOnboardingViewController) {
        print(#function)
        
        onboardingViewController.modalTransitionStyle = .crossDissolve
        onboardingViewController.dismiss(animated: true)
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        sceneDelegate?.window?.rootViewController = LaunchViewController()
        
    }
    
    
}



extension UIOnboardingViewConfiguration {
    // UIOnboardingViewController init
    static func setUp() -> UIOnboardingViewConfiguration {
        return .init(appIcon: UIOnboardingHelper.setUpIcon(),
                     firstTitleLine: UIOnboardingHelper.setUpFirstTitleLine(),
                     secondTitleLine: UIOnboardingHelper.setUpSecondTitleLine(),
                     features: UIOnboardingHelper.setUpFeatures(),
                     textViewConfiguration: UIOnboardingHelper.setUpNotice(),
                     buttonConfiguration: UIOnboardingHelper.setUpButton())
    }
}
