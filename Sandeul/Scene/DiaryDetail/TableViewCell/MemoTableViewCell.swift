//
//  MemoTableViewCell.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/10.
//

import UIKit
import SnapKit
import BaseFrame

class MemoTableViewCell: BaseTableViewCell {
    
    
    static let textViewPlaceHolder = "메모를 입력하세요"
    
    let textView : UITextView = {
        let view = UITextView()
        view.clipsToBounds = true
        view.text = textViewPlaceHolder
        view.textColor = Color.shared.Gray
        view.font = variousFont.smallMedium
        view.isEditable = true
        return view
    }()
    
    
    override func configure() {
        self.addSubview(textView)
    }
    
    override func constraints() {
        textView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
