//
//  ImagePicker.swift
//  ContactSwiftData
//
//  Created by LAANAYA Abderrazak on 4/3/2024.
//

import SwiftUI
import UIKit

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var didPickImage: (UIImage) -> Void
    
    init(didPickImage: @escaping (UIImage) -> Void) {
        self.didPickImage = didPickImage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            didPickImage(image)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

class ImagePicker: ObservableObject {
    static let shared = ImagePicker()
    
    private var coordinator: ImagePickerCoordinator?
    
    func showImagePicker(didPickImage: @escaping (UIImage) -> Void) {
        coordinator = ImagePickerCoordinator(didPickImage: didPickImage)
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = coordinator
        
        UIApplication.shared.windows.first?.rootViewController?.present(imagePicker, animated: true, completion: nil)
    }
}
