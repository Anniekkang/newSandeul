//
//  DiaryView.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/04.
//

import UIKit
import BaseFrame
import FSCalendar
import SnapKit

class DiaryView: BaseView {

    let calendar : FSCalendar = {
       let view = FSCalendar()
        return view
    }()
    
    override func configure() {
        self.addSubview(calendar)
    }
    
    override func constraints() {
        calendar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.trailing.leading.equalTo(safeAreaLayoutGuide).inset(10)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
    }
}
