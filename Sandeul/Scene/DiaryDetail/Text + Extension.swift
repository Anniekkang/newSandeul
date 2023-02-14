//
//  Text + Extension.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/14.
//

import UIKit

extension DiaryDetailViewController : UISearchBarDelegate {
   
    
    
}

extension DiaryDetailViewController : UITextViewDelegate {
    
    
    //textView - focus happening
    func textViewDidBeginEditing(_ textView: UITextView) {
       
        if textView.text == MemoTableViewCell.textViewPlaceHolder {
            textView.text = nil
            textView.textColor = Color.shared.Green
        }
        
    }
    
    //textView - focus lost
    func textViewDidEndEditing(_ textView: UITextView) {
    
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = MemoTableViewCell.textViewPlaceHolder
            textView.textColor = Color.shared.Gray
        }
    }
    
    
    
}

extension DiaryDetailViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

