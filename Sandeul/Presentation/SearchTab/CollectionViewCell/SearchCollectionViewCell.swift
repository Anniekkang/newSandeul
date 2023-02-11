//
//  SearchCollectionViewCell.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/08.
//

import UIKit
import BaseFrame
import SnapKit

class SearchCollectionViewCell: BaseCollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            //true = buttonTapped
            if isSelected {
                print("Select")
                self.view.layer.borderColor = Color.shared.Green.cgColor
                self.Label.textColor = Color.shared.Green

            }
            //false = buttonUntapped
            else {
                print("Deselect")
                self.view.layer.borderColor = Color.shared.Gray.cgColor
                self.Label.textColor = Color.shared.Gray
            }
        }
    }
    
    func selectedColorChange(cell : UICollectionViewCell,view : UIView, Label : UILabel)  {
        if cell.isSelected == false {
            view.layer.borderColor = Color.shared.Gray.cgColor
            Label.textColor = Color.shared.Gray
        }
    }
    
    let view : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = Color.shared.Gray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let Label : UILabel = {
        let label = UILabel()
        label.text = "All"
        label.textColor = Color.shared.Gray
        label.textAlignment = .center
        return label
    }()
    
    override func configure() {
        self.addSubview(view)
        view.addSubview(Label)
    }
    
    override func constraints() {
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        Label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
