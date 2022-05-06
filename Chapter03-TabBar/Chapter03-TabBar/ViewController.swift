//
//  ViewController.swift
//  Chapter03-TabBar
//
//  Created by 이규빈 on 2022/04/30.

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // title label
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        
        //title label properties
        title.text = "First Tab"
        title.textColor = .red
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 14)
        
        //title Autoresize
        title.sizeToFit()
        
        //title Alignment
        title.center.x = self.view.frame.width / 2 //center of x
        
        //add to superview
        self.view.addSubview(title)
        
        //move to sceneDelegate
        //tabbar item
        //self.tabBarItem.image = UIImage(named: "calendar.png")
        //self.tabBarItem.title = "Calendar"
    }
    
    //MARK: - Helper
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = self.tabBarController?.tabBar
//        tabBar?.isHidden = (tabBar?.isHidden == true) ?false :true
        
        UIView.animate(withDuration: TimeInterval(0.15)) {
            //alpha value change gradually
            tabBar?.alpha = (tabBar?.alpha == 0 ? 1 : 0)
        }
    }


}

