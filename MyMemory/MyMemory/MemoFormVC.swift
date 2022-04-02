//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by 이규빈 on 2022/03/29.
//

import UIKit

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    var subject: String!
    //MARK: - Properties
    
    @IBOutlet weak var contentTV: UITextView!
    @IBOutlet weak var previewImg: UIImageView!
    
    //save Button
    @IBAction func saveBtn(_ sender: Any) {
        //non data
        guard self.contentTV.text?.isEmpty == false else {
            let alert = UIAlertController(title: nil, message: "Enter Contents", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        //put data
        let data = MemoData()
        
        data.title = self.subject
        data.content = self.contentTV.text
        data.image = self.previewImg.image
        data.regdate = Date()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        //Done & Exit
        _ = self.navigationController?.popViewController(animated: true)
    }
    //camera Button
    @IBAction func picBtn(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        //picker display
        self.present(picker, animated: true)
    }
    //select image method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //print ro preview
        self.previewImg.image = info[.editedImage] as? UIImage
        
        //close controller
        picker.dismiss(animated: false)

    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
//        super.viewDidLoad()
        self.contentTV.delegate = self
        
    }
    func textViewDidChange(_ textView: UITextView) {
        let contentTV = textView.text as NSString
        let length = ((contentTV.length > 15) ? 15 : contentTV.length)
        self.subject = contentTV.substring(with: NSRange(location: 0, length: length))
        
        self.navigationItem.title = self.subject
    }
}
