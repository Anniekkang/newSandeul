//
//  DiaryViewController.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/03.
//

import UIKit
import BaseFrame
import SnapKit


class DiaryViewController: BaseViewController {
    
    let mainView = DiaryView()
    lazy var calendar = mainView.calendar
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navDesign()
        customButton()
        calendarDesign()
    }
    
    func navDesign() {
        self.navigationItem.title = "Diary"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func customButton() {
        let plusButton = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        plusButton.image = UIImage(named: "addsquare")
        self.navigationController?.navigationBar.addSubview(plusButton)
        
        plusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(30)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(plusButtonTapped))
        plusButton.addGestureRecognizer(tapGesture)
        plusButton.isUserInteractionEnabled = true
        
    }
    
    @objc func plusButtonTapped() {
        let nav = UINavigationController(rootViewController: DiaryDetailViewController())
        self.navigationController?.present(nav, animated: true)
    }
    
    func calendarDesign() {
        calendar.appearance.selectionColor = Color.shared.Green.withAlphaComponent(0.5)
        calendar.appearance.todayColor = Color.shared.Green
        calendar.scrollEnabled = true
        calendar.scrollDirection = .horizontal
        calendar.headerHeight = 60
        calendar.appearance.headerTitleColor = Color.shared.black
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 18, weight: .bold)
        calendar.appearance.weekdayTextColor = Color.shared.darkGray
        calendar.locale = Locale(identifier: "en_EN")
        calendar.allowsMultipleSelection = false
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.eventDefaultColor = Color.shared.Green
        calendar.appearance.eventSelectionColor = Color.shared.Yellow
        calendar.scope = .month
        
    }
    
    
}
