//
//  MemoReadVC.swift
//  MyMemory
//
//  Created by 이규빈 on 2022/03/29.
//

import UIKit

class MemoReadVC: UIViewController {
    
    var param: MemoData?

    @IBOutlet weak var subjectread: UILabel!
    @IBOutlet weak var contentread: UILabel!
    @IBOutlet weak var imgread: UIImageView!
    
    override func viewDidLoad() {
       

        //print
        self.subjectread.text = param?.title
        self.contentread.text = param?.content
        self.imgread.image = param?.image
        
        //date format
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"
        let dateString = formatter.string(from: (param?.regdate)!)
        
        //print
        self.navigationItem.title = dateString
    }


}
