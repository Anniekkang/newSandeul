//
//  LaunchViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/04.
//

import UIKit
import BaseFrame
import NVActivityIndicatorView
import RealmSwift

class LaunchViewController: BaseViewController {
    
    let realm = try! Realm()
    
    var tasks : Results<Mountain>! {
        didSet {
            
            
        }
    }
    
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
            guard let url = URL(string: Endpoint.mountainURL) else { return }
            
            print(url)
            self.setParser(from: url)
            print("parsing done")
            
            
            DispatchQueue.main.sync {
                
                self.realmSave()
                self.fetchRealm()
                
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                let sceneDelegate = windowScene?.delegate as? SceneDelegate
                sceneDelegate?.window?.rootViewController = TabbarController()
            }
        }
        
        
    }
    
    
    
    func realmSave() {
        
            
            do {
                try self.realm.write {
                    
                    for i in 0...99 {
                        let title = constant.models[i].title
                        let altitude = constant.models[i].altitude
                        let location = constant.models[i].location
                        let course = constant.models[i].course
                        
                        let task = Mountain(title: title, altitude: altitude, location: location, course: course)
                        
                        self.realm.add(task)
                    }
                }
            } catch let error as NSError {
                // Failed to write to realm.
                // ... Handle error ...
            }
            
            
        
        
        
    }
    
    func fetchRealm(){
        tasks = realm.objects(Mountain.self).sorted(byKeyPath: "title", ascending: true)
        print("==Realm is located at:", realm.configuration.fileURL!)
        
        
    }
    
    
}
    
    
    
    
    
    
