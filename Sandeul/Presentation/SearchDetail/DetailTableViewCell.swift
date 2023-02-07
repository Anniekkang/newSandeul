//
//  SearchDetailTableViewCell.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/07.
//

import UIKit
import BaseFrame

class DetailTableViewCell: BaseTableViewCell {

    let label : UILabel = {
        let label = UILabel()
        label.text = "blarblar"
        label.textColor = Color.shared.black
        return label
    }()

}
