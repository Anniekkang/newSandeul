//
//  UIViewController+Extension.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/05.
//

import UIKit
import Toast

extension UIViewController {
    
    func showToast(view : UIView, Message : String, title : String) {
        view.makeToast(Message, duration: 1.5,
                                point: CGPoint(x: view.center.x, y: 250),
                               title: title,
                               image: nil,
                       style: self.toastStyle(),
                               completion: nil)
    }
    
    func toastStyle() -> ToastStyle {
        var style = ToastStyle()
        style.backgroundColor = Color.shared.Green
        style.messageColor = Color.shared.Gray
        style.messageAlignment = .center
        style.titleAlignment = .center
        style.fadeDuration = 0.8
        return style
        
    }
    
    
}
