//
//  Camera + Extension.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/14.
//
import UIKit

extension DiaryDetailViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func openAlbum() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.sourceType = .photoLibrary
            present(picker, animated: true)
        } else {
            print("album is not available")
        }
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            present(picker, animated: true)
        } else {
            print("camera is not avaliable")
        }
    }
}
