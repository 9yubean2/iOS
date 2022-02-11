//
//  ViewController.swift
//  Tab
//
//  Created by 이규빈 on 2022/01/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnGotoImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnGotoDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

