//
//  ViewController.swift
//  mission_PageControl
//
//  Created by 이규빈 on 2022/01/15.
//

import UIKit

class ViewController: UIViewController {
    
    var number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    @IBOutlet var lblNumberOfPage: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = number.count
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        lblNumberOfPage.text = String(number[0])
    }

    @IBAction func changePage(_ sender: UIPageControl) {
        lblNumberOfPage.text = String(number[pageControl.currentPage])
    }
    
}

