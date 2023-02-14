//
//  DiaryDetailViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/04.
//

import UIKit
import BaseFrame

enum titleArray {
    static let firstTitle = ["산 이름","지역","고도"]
    static let secondTitle = ["","날짜","산행시간","거리"]
    
}

class DiaryDetailViewController: BaseViewController {
    
    let mainView = DiaryDetailView()
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = Color.shared.Gray
        mainView.tableView.sectionHeaderHeight = 5
        mainView.searchBar.becomeFirstResponder()
        self.hideKeyboardTapped()
        navDesign()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //searchBar 높이 조정인데 not working...
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.mainView.searchBar.layoutIfNeeded()
        self.mainView.searchBar.layoutSubviews()
        
        for subView in mainView.searchBar.subviews
        {
            for subsubView in subView.subviews
            {
                if let textField = subsubView as? UITextField
                {
                    var currentTextFieldBounds = textField.bounds
                    currentTextFieldBounds.size.height = 80
                    textField.bounds = currentTextFieldBounds
                    textField.borderStyle = .roundedRect
                }
            }
        }
    }
    
    func navDesign() {
        let cancelItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        let submitItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(submitButtonTapped))
        self.navigationItem.rightBarButtonItems = [submitItem,cancelItem]
        self.navigationController?.navigationBar.isTranslucent = true
        
       
        self.navigationController?.navigationBar.standardAppearance = scrollNavDesign()
        self.navigationController?.navigationBar.scrollEdgeAppearance = scrollNavDesign()
        
    }
    
    func scrollNavDesign() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = Color.shared.white
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        return appearance
    }
    
    @objc func cancelButtonTapped() {
        self.dismiss(animated: true)
    }
    
    @objc func submitButtonTapped() {
        //save data on Realm
    }
    
    override func configure() {
        mainView.searchBar.delegate = self
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(DiaryDetailTableViewCell.self, forCellReuseIdentifier: DiaryDetailTableViewCell.reuseIdentifier)
        mainView.tableView.register(CameraTableViewCell.self, forCellReuseIdentifier: CameraTableViewCell.reuseIdentifier)
        mainView.tableView.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.reuseIdentifier)
        
        
    }
}

extension DiaryDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 3 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0,1,2,3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DiaryDetailTableViewCell.reuseIdentifier, for: indexPath) as? DiaryDetailTableViewCell else { return UITableViewCell() }
            
            cell.selectionStyle = .none
            cell.contentView.isUserInteractionEnabled = false
            
            if indexPath.section == 0 {
                cell.titleLabel.text = titleArray.firstTitle[indexPath.item]
                cell.contentLabel.placeholder = titleArray.firstTitle[indexPath.item]
                cell.contentLabel.delegate = self
                
            } else {
                cell.titleLabel.text = titleArray.secondTitle[indexPath.section]
                cell.contentLabel.placeholder = titleArray.secondTitle[indexPath.section]
            }
            
            return cell
        case 4 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CameraTableViewCell.reuseIdentifier, for: indexPath) as? CameraTableViewCell else { return UITableViewCell() }
            
            return cell
        case 5 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.reuseIdentifier, for: indexPath) as? MemoTableViewCell else { return UITableViewCell() }
            
            cell.textView.delegate = self
            
            
            return cell
        default :
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 4 || indexPath.section == 5 ? UIScreen.main.bounds.size.width * 0.4 : 50    }
    
    
    
}


