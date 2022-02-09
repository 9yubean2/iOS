//
//  ViewController.swift
//  ImageViewer
//
//  Created by 이규빈 on 2022/01/10.
//

import UIKit

class ViewController: UIViewController {
    
    var maxImage = 6
    var numImage = 1
    
    @IBOutlet var imgImageViewer: UIImageView!
    @IBOutlet var btnPreview: UIButton!
    @IBOutlet var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changePreview(_ sender: UIButton) {
        numImage = numImage - 1
        if (numImage < 1) {
            numImage = maxImage
        }
        let imageName = String(numImage) + ".png"
        imgImageViewer.image = UIImage(named: imageName)
    }
    
    @IBAction func changeNext(_ sender: UIButton) {
        numImage = numImage + 1
        if (numImage > maxImage) {
            numImage = 1
        }
        let imageName = String(numImage) + ".png"
        imgImageViewer.image = UIImage(named: imageName)
    }
}

