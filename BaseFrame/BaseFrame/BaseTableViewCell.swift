//
//  BaseTableViewCell.swift
//  BaseFrame
//
//  Created by 나리강 on 2023/02/06.
//

import UIKit

open class BaseTableViewCell: UITableViewCell {

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        constraints()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    open func configure() {}
    
    open func constraints() {}
    
}
