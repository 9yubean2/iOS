//
//  SecondViewController.swift
//  Delegata&Protocol
//
//  Created by 이규빈 on 2022/04/08.
//

import UIKit

class SecondViewController: UIViewController, ChangeLabelDelegate {
    
    func doChange() {
        previousViewController?.label.text = self.textField.text
    }
    

    @IBOutlet weak var textField: UITextField!
    
    var previousViewController : ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        previousViewController?.deldgate = self
    }
    

    @IBAction func ButtonDismissDidTapped(_ sender: Any) {
//        doChange()
//        dismiss(animated: true, completion: nil)
        if let text = textField.text{
            NotificationCenter.default.post(name: NSNotification.Name("sample"), object: text)
        }
        dismiss(animated: true, completion: nil)
        
        
    }
    

}
