//
//  ProfileVC.swift
//  MyMemory
//
//  Created by 이규빈 on 2022/05/07.
//

import UIKit

class ProfileVC: UIViewController, UITableViewDelegate,UITableViewDataSource {

    //MARK: - Properties
    let profileImage = UIImageView() //프로필 사진
    let tv = UITableView() //프로필 목록
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션바 숨기기
        self.navigationController?.navigationBar.isHidden = true
        //닫기 버튼
        let backBtn = UIBarButtonItem(title: "close", style: .plain, target: self, action: #selector(close(_:)))
        self.navigationItem.leftBarButtonItem = backBtn
        
        
        //프로필 이미지
        let image = UIImage(named: "account.jpg")
        
        self.profileImage.image = image
        self.profileImage.frame.size = CGSize(width: 100, height: 100)
        self.profileImage.center = CGPoint(x: self.view.frame.width / 2, y: 270)
        
        self.profileImage.layer.cornerRadius = profileImage.frame.width / 2
        self.profileImage.layer.borderWidth = 0
        self.profileImage.layer.masksToBounds = true
        
        self.view.addSubview(self.profileImage)
        
        //테이블 뷰
        self.tv.frame = CGRect(x: 0, y: self.profileImage.frame.origin.y + self.profileImage.frame.size.height + 30, width: self.view.frame.width,
        height: 100)
        self.tv.dataSource = self
        self.tv.delegate = self
        self.view.addSubview(self.tv)
        
        //배경 이미지
        let bg = UIImage(named: "Rectangle 2")
        let bgImg = UIImageView(image: bg)
        
        bgImg.frame.size = CGSize(width: bgImg.frame.size.width, height: bgImg.frame.size.height)
        bgImg.center = CGPoint(x: self.view.frame.width / 2 , y: 40)
        bgImg.layer.cornerRadius = bgImg.frame.size.width / 2
        bgImg.layer.borderWidth = 0
        bgImg.layer.masksToBounds = true
        
        self.view.addSubview(bgImg)
        //추가
        self.view.bringSubviewToFront(self.tv)
        self.view.bringSubviewToFront(self.profileImage)
    }
    //MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.accessoryType = .disclosureIndicator
        
        switch indexPath.row {
        case 0  :
            cell.textLabel?.text = "Name"
            cell.detailTextLabel?.text = "9yubean2"
        case 1 :
            cell.textLabel?.text = "Account"
            cell.detailTextLabel?.text = "mail@gamil.com"
        default :
            ()
        }
        return cell
    }
    
    //MARK: - Helper
    @objc func close(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
