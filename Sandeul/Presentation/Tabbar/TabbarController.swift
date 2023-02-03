//
//  TabbarController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/03.
//

import UIKit

class TabbarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
        self.tabBar.backgroundColor = .white
        
    }
    func configuration(){
        
        let firstTap = MainViewController()
        let nav1 = UINavigationController(rootViewController: firstTap)
        let secondTap = SearchViewController()
        let nav2 = UINavigationController(rootViewController: secondTap)
        let thirdTap = DiaryViewController()
        let nav3 = UINavigationController(rootViewController: thirdTap)
        let fourthTap = SettingViewController()
        let nav4 = UINavigationController(rootViewController: fourthTap)
        
        let firstBarItem = UITabBarItem(title: "Main", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        let secondBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), selectedImage: UIImage(named: "search"))
        let thirdBarItem = UITabBarItem(title: "Diary", image: UIImage(named: "calendar"), selectedImage: UIImage(named: "calendar"))
        let fourthBarItem = UITabBarItem(title: "Setting", image: UIImage(named: "settings"), selectedImage: UIImage(named: "settings"))
    
        nav1.tabBarItem = firstBarItem
        nav2.tabBarItem = secondBarItem
        nav3.tabBarItem = thirdBarItem
        nav4.tabBarItem = fourthBarItem
        
        setViewControllers([nav1,nav2,nav3,nav4], animated: true)
       
        
    }

    
}
