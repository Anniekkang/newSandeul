//
//  DetailViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/04.
//

import UIKit
import BaseFrame
import RealmSwift

class DetailViewController: BaseViewController {

    let realm = try! Realm()
    
    let titleArray = ["위치", "고도", "난이도", "코스"]
    var givenRealm : Results<Mountain>?
    
    
    let mainView = DetailView()
    override func loadView() {
        self.view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
   
    override func configure() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.reuseIdentifier)
    }
}

extension DetailViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.reuseIdentifier, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        
        switch indexPath.section {
        case 0 :
            cell.label.text = MountainRepository.shared.selectedRealm[0].location
        case 1 :
            cell.label.text = "\(MountainRepository.shared.selectedRealm[0].altitude) m"
        case 2 :
            cell.label.text = checkDifficulty(altitude : MountainRepository.shared.selectedRealm[0].altitude) 
        case 3 :
            cell.label.text = MountainRepository.shared.selectedRealm[0].course
        default :
            cell.label.text = "Error"
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleArray[section]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderView()
        header.label.text = titleArray[section]
        header.label.textColor = Color.shared.Green
        header.arrow.isHidden = true
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    func checkDifficulty(altitude : String) -> String {
        guard let intAltitude = Int(altitude) else { return "확인불가" }
        var difficulty : String = "확인불가"
        
        if intAltitude >= 1000 {
            difficulty = "상급"
        } else if intAltitude >= 500 {
            difficulty = "중급"
        } else {
            difficulty = "초급"
        }
        return difficulty
    }
    
}
