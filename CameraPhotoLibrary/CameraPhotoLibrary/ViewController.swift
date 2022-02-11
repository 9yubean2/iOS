//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by 이규빈 on 2022/01/19.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var imgView: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var videoURL: URL!
    var flagImageSave = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPhotoShoot(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [UTType.image.identifier as String]
            imagePicker.allowsEditing = false //편집을 허용하지 않음
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
    @IBAction func btnBringPhoto(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [UTType.image.identifier as String]
            imagePicker.allowsEditing = true //편집을 허용
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    
    @IBAction func btnVideoShoot(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [UTType.movie.identifier as String]
            imagePicker.allowsEditing = false //편집을 허용하지 않음
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
    @IBAction func btnBringVideo(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [UTType.movie.identifier as String]
            imagePicker.allowsEditing = false //편집을 허용하지 않음
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if mediaType.isEqual(to: UTType.image.identifier as NSString as String) {
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            if  flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            imgView.image = captureImage
        }
        else if mediaType.isEqual(to: UTType.movie.identifier as NSString as String) {
            if flagImageSave {
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
                
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //경고 표시
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: "OK", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

