//
//  ControllViewController.swift
//  Chapter03-Alert
//
//  Created by 이규빈 on 2022/05/01.
//

import UIKit

class ControllViewController: UIViewController {

    let slider = UISlider()
    
    var sliderValue :Float {
        return self.slider.value
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        //set slider min/max value
        self.slider.minimumValue = 0
        self.slider.maximumValue = 100
        
        //set slider frame
        self.slider.frame = CGRect(x: 0, y: 0, width: 170, height: 30)
        self.view.addSubview(slider)
        
        self.preferredContentSize = CGSize(width: self.slider.frame.width, height: self.slider.frame.height+10)
    }
    

   

}
