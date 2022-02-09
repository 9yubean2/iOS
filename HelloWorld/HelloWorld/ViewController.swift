//
//  ViewController.swift
//  HelloWorld
//
//  Created by 이규빈 on 2022/01/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtName: UITextField!
    @IBOutlet var lblHello: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text = "Hello, " + txtName.text!
    }
    
}

