//
//  ViewController.swift
//  PageControl
//
//  Created by 이규빈 on 2022/01/15.
//

import UIKit

class ViewController: UIViewController {
    
    var images = ["1.jpeg", "2.jpeg", "3.jpeg", "4.PNG", "5.jpeg"]

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        imageView.image = UIImage(named: images[0])
    }


    @IBAction func pageChange(_ sender: UIPageControl) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }
}

