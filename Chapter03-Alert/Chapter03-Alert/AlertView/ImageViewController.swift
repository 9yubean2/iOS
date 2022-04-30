//
//  ImageViewController.swift
//  Chapter03-Alert
//
//  Created by 이규빈 on 2022/05/01.
//

import UIKit

class ImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imgRating = UIImage(named: "rating5")
        let imgView = UIImageView(image: imgRating)
        
        imgView.frame = CGRect(x: 0, y: 0, width: (imgRating?.size.width)!, height: (imgRating?.size.height)!)
        
        self.view.addSubview(imgView)
        
        self.preferredContentSize = CGSize(width: (imgRating?.size.width)!, height: (imgRating?.size.height)!+10)
    }
    

}
