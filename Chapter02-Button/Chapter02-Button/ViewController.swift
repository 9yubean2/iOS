//
//  ViewController.swift
//  Chapter02-Button
//
//  Created by 이규빈 on 2022/04/09.
//

import UIKit

class ViewController: UIViewController {
    
    var paramEmail : UITextField!
    var paramUpdate: UISwitch!
    var txtUpdate: UILabel!
    var paramInterval: UIStepper!
    var txtInterval: UILabel!

    override func viewDidLoad() {
        //set navigation bar title
        self.navigationItem.title = "Setting"
        
        //email label setting
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y : 100, width: 100, height: 30)
        lblEmail.text = "email"
        //label font setting
        lblEmail.font = UIFont.systemFont(ofSize: 14)
        
        //email text field setting
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y : 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.borderStyle = .roundedRect
        self.paramEmail.autocapitalizationType = .none
        self.paramEmail.placeholder = "Enter Email"
        
        
        //update label setting
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: 30, y : 150, width: 100, height: 30)
        lblUpdate.text = "update"
        //label font setting
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        
        //update switch setting
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 120, y : 150, width: 50, height: 30)
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
        
        //update text setting
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12)
        self.txtUpdate.textColor = UIColor.red
        self.txtUpdate.text = "No Update"
        
        
        //interval label setting
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 30, y : 200, width: 100, height: 30)
        lblInterval.text = "interval"
        //label font setting
        lblInterval.font = UIFont.systemFont(ofSize: 14)
        
        //interval stepper setting
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: 120, y : 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0
        self.paramInterval.maximumValue = 100
        self.paramInterval.stepValue = 1
        self.paramInterval.value = 0
        self.paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        
        //interval text setting
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = UIColor.red
        self.txtInterval.text = "for 0 minute"
        
        //submit button setting
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(submit(_:)))
        self.navigationItem.rightBarButtonItem = submitBtn
        
//        let btn = UIButton(type: .system) //1
//        btn.frame = CGRect(x: 50, y : 100, width: 150, height: 30) //2
//        btn.setTitle("Test Button", for: .normal) //3
//        btn.center = CGPoint(x: self.view.frame.size.width / 2, y : 100)
//
//        self.view.addSubview(btn)
//        btn.addTarget(self, action: #selector(onClick(_:)), for: .touchUpInside)
        
        //add subview
        self.view.addSubview(lblEmail)
        self.view.addSubview(paramEmail)
        self.view.addSubview(lblUpdate)
        self.view.addSubview(paramUpdate)
        self.view.addSubview(txtUpdate)
        self.view.addSubview(lblInterval)
        self.view.addSubview(txtInterval)
        self.view.addSubview(paramInterval)

    }
    
    //MARK: - Helper
    @objc func onClick(_ sender: Any) {
        if let btn = sender as? UIButton {
            btn.setTitle("틀릭되었습니다.", for: .normal)
        }
    }
    
    @objc func presentUpdateValue(_ sender: UISwitch) {
        self.txtUpdate.text = (sender.isOn == true ? "Update" : "No Update")
    }
    
    @objc func presentIntervalValue(_ sender: UIStepper) {
        self.txtInterval.text = ("for \( Int(sender.value) ) minute")
    }

    @objc func submit(_ sender: Any) {
        let rvc = ReadViewController()
        rvc.pEmail = self.paramEmail.text
        rvc.pUpdate = self.paramUpdate.isOn
        rvc.pInterval = self.paramInterval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }


}

