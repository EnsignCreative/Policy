//
//  ImagePicker.swift
//  Policy
//
//  Created by Bradley Ensign on 6/3/22.
//


import UIKit
import Photos
import AVFoundation

protocol ImagePickerPresenter {
    var imagePickerHandler: ImagePickerHandler { get set }
    func presentMediaPicker(fromController controller: UIViewController, sourceType: UIImagePickerController.SourceType)
    func didSelectFromMediaPicker(withImage image: UIImage)
    func didSelectFromMediaPicker(withMediaUrl mediaUrl: NSURL)
}


class ImagePickerHandler: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var selectedImage: UIImage?
    var delegate: ImagePickerPresenter?
    let picker = UIImagePickerController()
    let sourceType: UIImagePickerController.SourceType
    
    init(sourceType: UIImagePickerController.SourceType) {
        self.sourceType = sourceType
        super.init()
        self.picker.delegate = self
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let editedImage = info[.editedImage] as? UIImage { selectedImage = editedImage } else
        if let originalImage = info[.originalImage] as? UIImage { selectedImage = originalImage }
        
        if let image = selectedImage { delegate?.didSelectFromMediaPicker(withImage: image) }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


extension ImagePickerPresenter {
    func presentMediaPicker(fromController controller: UIViewController, sourceType: UIImagePickerController.SourceType) {
        let photos = PHPhotoLibrary.authorizationStatus()
        guard photos != .denied else { presentAlert(for: controller); return }
        
        imagePickerHandler.delegate = self
        controller.present(imagePickerHandler.picker, animated: true, completion: nil)
    }
    
    
    private func presentAlert(for controller: UIViewController) {
        let action = SystemAlert.deniedPhotos.detail
        let alert = UIAlertController(title: action.title, message: action.message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: action.buttonTitle, style: .default, handler: { (action) in }))
        controller.present(alert, animated: true, completion: nil)
    }
    
    func didSelectFromMediaPicker(withMediaUrl mediaUrl: NSURL) {}
}

