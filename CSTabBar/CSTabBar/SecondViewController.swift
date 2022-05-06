//
//  SecondViewController.swift
//  CSTabBar
//
//  Created by 이규빈 on 2022/05/06.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        //CSStepper 정의
        let stepper = CSStepper()
        stepper.frame = CGRect(x: 30, y: 100, width: 130, height: 30)
        //valueCahnge 이벤트가 발생하면 logging 메소드 호출
        stepper.addTarget(self, action: #selector(logging(_:)), for: .valueChanged)
        self.view.addSubview(stepper)
    }
    @objc func logging(_ sender: CSStepper) {
        NSLog("현재 스태퍼 값은 \(sender.value)입니다.")
    }
}
