//
//  BaseView.swift
//  BaseFrame
//
//  Created by 나리강 on 2023/02/03.
//

import UIKit

open class BaseView: UIView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        constraints()
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configure() {
        
    }
    
    open func constraints() {
        
    }

}
