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
    
    let picker = UIImagePickerController()
    let mainView = DiaryDetailView()
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = Color.shared.Gray
        mainView.tableView.sectionHeaderHeight = 5
        self.hideKeyboardTapped()
        navDesign()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func navDesign() {
        let cancelItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        let submitItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(submitButtonTapped))
        self.navigationItem.rightBarButtonItems = [submitItem,cancelItem]
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.standardAppearance = scrollNavDesign()
        self.navigationController?.navigationBar.scrollEdgeAppearance = scrollNavDesign()
        //self.navigationController?.navigationBar.compactAppearance = scrollNavDesign()
        
    }
    
    func scrollNavDesign() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = Color.shared.white
        self.navigationController?.navigationBar.prefersLargeTitles = false
        return appearance
    }
    
    @objc func cancelButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func submitButtonTapped() {
        //save data on Realm
    }
    
    override func configure() {
      //  mainView.searchBar.delegate = self
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
        case 4 ://camera
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CameraTableViewCell.reuseIdentifier, for: indexPath) as? CameraTableViewCell else { return UITableViewCell() }
                
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cameraImageTapped))
            
            cell.contentView.isUserInteractionEnabled = false
            cell.selectionStyle = .none
            
            cell.cameraImage.addGestureRecognizer(tapGesture)
            cell.cameraImage.isUserInteractionEnabled = true
            return cell
        case 5 : //memotextView
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.reuseIdentifier, for: indexPath) as? MemoTableViewCell else { return UITableViewCell() }
            
            cell.contentView.isUserInteractionEnabled = false
            cell.selectionStyle = .none
            
            cell.textView.delegate = self
            
            
            return cell
        default :
            return UITableViewCell()
        }
        
    }
    
    @objc func cameraImageTapped() {
    
        checkCameraPermission()
        
        let alert = UIAlertController(title: "이미지", message: "이미지를 가져올 곳을 골라주세요", preferredStyle: .actionSheet)
        let cameraButton = UIAlertAction(title: "카메라로 찍기", style: .default) { UIAlertAction in
            self.openCamera()
        }
        let albumButton = UIAlertAction(title: "앨범에서 가져오기", style: .default) { UIAlertAction in
            self.openAlbum()
        }
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(cameraButton)
        alert.addAction(albumButton)
        alert.addAction(cancelButton)
        present(alert, animated: true)
      
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 4 || indexPath.section == 5 ? UIScreen.main.bounds.size.width * 0.4 : 50    }
    
    
    
}


