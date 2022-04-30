//
//  ViewController.swift
//  Chapter03-NavigationBar
//
//  Created by 이규빈 on 2022/04/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.initTitle()
        //self.initTitleImage()
        self.initTitleSearchbar()
    }
    func initTitleSearchbar() {
        
        let btnBack = UIImage(named: "arrow-back")
//        btnBack.frame = CGRect(x: 0, y: 0, width: 150, height: 37)
//        btnBack.backgroundColor = .brown
        let leftItem = UIBarButtonItem(image: btnBack, style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftItem
        
        //right view
        let rightV = UIView()
        rightV.frame = CGRect(x: 0, y: 0, width: 70, height: 37)
//        rightV.backgroundColor = .red
        let rightItem = UIBarButtonItem(customView: rightV)
        self.navigationItem.rightBarButtonItem = rightItem
        //right bar button item #1
        let cnt = UILabel()
        cnt.frame = CGRect(x: 10, y: 8, width: 20, height: 20)
        cnt.font = UIFont.boldSystemFont(ofSize: 10)
        cnt.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0)
        cnt.text = "12"
        cnt.textAlignment = .center
        cnt.layer.cornerRadius = 3
        cnt.layer.borderWidth = 2
        cnt.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        
        //right bar button item #2
        let btnMore = UIButton()
        btnMore.frame = CGRect(x: 50, y: 10, width: 16, height: 16)
        btnMore.setImage(UIImage(named: "more"), for: .normal)
        
        //right bar button item add subview
        rightV.addSubview(cnt)
        rightV.addSubview(btnMore)
        
        //search bar
        let tf = UITextField()
        
        tf.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
        tf.backgroundColor = .white
        tf.font = UIFont.systemFont(ofSize: 13)
        tf.autocapitalizationType = .none //Off auto capitalization
        tf.autocorrectionType = .no //Off auto correction
        tf.spellCheckingType = .no //Off spelling check
        tf.keyboardType = .URL
        tf.keyboardAppearance = .dark
        tf.layer.borderWidth = 0.3
        tf.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        
        self.navigationItem.titleView = tf
    }
    /*
    func initTitleImage() {
        let image = UIImage(named: "swift_logo")
        let imageV = UIImageView(image: image)
        
        self.navigationItem.titleView = imageV
    }
    func initTitle() {
        //navigation bar view
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
        
        //top title label & set properties
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = UIFont.systemFont(ofSize: 15)
        topTitle.textColor = .white
        topTitle.text = "58개 숙소"
        
        //bottom title label & set properties
        let bottomTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        bottomTitle.numberOfLines = 1
        bottomTitle.textAlignment = .center
        bottomTitle.font = UIFont.systemFont(ofSize: 12)
        bottomTitle.textColor = .white
        bottomTitle.text = "1박(1월 10일 ~ 1월 11일)"
        
        //set navigation title
        self.navigationItem.titleView = containerView
        containerView.addSubview(topTitle)
        containerView.addSubview(bottomTitle)
        
        //set background
        let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
        self.navigationController?.navigationBar.backgroundColor = color
        
    }
     */


}

