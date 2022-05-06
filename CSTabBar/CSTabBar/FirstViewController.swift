//
//  FirstViewController.swift
//  CSTabBar
//
//  Created by 이규빈 on 2022/05/06.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let frame = CGRect(x: 30, y: 50, width: 150, height: 30)
//        let btn_CS = CSButton(frame: frame)
//        self.view.addSubview(btn_CS)
        
//        let btn_CS_void = CSButton()
//        btn_CS_void.frame = CGRect(x: 30, y: 150, width: 150, height: 30)
//        self.view.addSubview(btn_CS_void)
        
        let btnRect = CSButton(type: .rect)
        btnRect.frame = CGRect(x: 30, y: 400, width: 150, height: 30)
        self.view.addSubview(btnRect)
        
        let btnCircle = CSButton(type: .circle)
        btnCircle.frame = CGRect(x: 200, y: 400, width: 150, height: 30)
        self.view.addSubview(btnCircle)
        
        //btnCircle.style = .rect
    }
}
