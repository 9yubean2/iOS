//
//  ReadViewController.swift
//  Chapter02-Button
//
//  Created by 이규빈 on 2022/04/09.
//

import UIKit

class ReadViewController: UIViewController {
    
    var pEmail : String?
    var pUpdate : Bool?
    var pInterval : Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let email = UILabel()
        email.frame = CGRect(x: 50, y : 100, width: 300, height: 30)
        email.text = "email : \(self.pEmail! )"
        let update = UILabel()
        update.frame = CGRect(x: 50, y : 150, width: 300, height: 30)
        update.text = "update status : \(self.pUpdate == true ? "Do update": "Do not update")"
        let interval = UILabel()
        interval.frame = CGRect(x: 50, y : 200, width: 300, height: 30)
        interval.text = "interval : for \(self.pInterval! )minute"
        
        self.view.addSubview(email)
        self.view.addSubview(update)
        self.view.addSubview(interval)

        
    }
    

}
