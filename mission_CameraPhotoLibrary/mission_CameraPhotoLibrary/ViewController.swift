//
//  ViewController.swift
//  mission_CameraPhotoLibrary
//
//  Created by 이규빈 on 2022/01/20.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var numImage = 0
    
    @IBOutlet var imgView1: UIImageView!
    @IBOutlet var imgView2: UIImageView!
    @IBOutlet var imgView3: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var flagImageSave = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnTakePhoto(_ sender: UIButton) {
        //카메라 사용가능
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            
            numImage = numImage + 1
            if numImage > 3 {numImage = 1}
            
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [UTType.image.identifier as String]
            
            imagePicker.allowsEditing = false //편집 허용하지 않음
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
    @IBAction func btnLoadPhoto(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            
            numImage = numImage + 1
            if numImage > 3 {numImage = 1}
            
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [UTType.image.identifier as String]
            
            imagePicker.allowsEditing = true //편집 허용하지 않음
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    
    @IBAction func btnReset(_ sender: UIButton) {
        numImage = 0
        imgView1.image = nil
        imgView2.image = nil
        imgView3.image = nil
    }
    
    //사진 촬영이나 선택이 끝났을 때 호출되는 델리게이트 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //미디어 종류 확인
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if mediaType.isEqual(to: UTType.image.identifier as NSString as String){
            //사진을 가져옴
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            //가져온 사진을 이미지뷰에 출력
            if numImage == 1 { imgView1.image = captureImage }
            else if numImage == 2 { imgView2.image = captureImage }
            else if numImage == 3 { imgView3.image = captureImage }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    //사진 촬영이나 선택을 취소했을 때 호출되는 델리게이트 메서드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        numImage = numImage - 1
        if numImage < 0 { numImage = 0 }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: title, style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

