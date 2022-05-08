//
//  SideBarVC.swift
//  MyMemory
//
//  Created by 이규빈 on 2022/05/07.
//

import UIKit

class SideBarVC: UITableViewController {
    //MARK: - Properties
    //메뉴 제목 배열
    let titles = [
        "Write a New Post",
        "Friend's New Post",
        "See Calendar",
        "Notice",
        "Statistics",
        "Account Management"
    ]
    //메뉴 아이콘 배열
    let icons = [
        UIImage(named: "write"),
        UIImage(named: "new"),
        UIImage(named: "calendar"),
        UIImage(named: "notice"),
        UIImage(named: "statistic"),
        UIImage(named: "setting")
    ]
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //계정 정보를 표시할 이미지, 레이블 객체 정의
        let profileImage = UIImageView()
        let nameLabel = UILabel()
        let emailLabel = UILabel()
        
        let defaultImage = UIImage(named: "account.jpg")
        profileImage.image = defaultImage
        profileImage.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.borderWidth = 0
        profileImage.layer.masksToBounds = true
        
        nameLabel.frame = CGRect(x: 70, y: 15, width: 100, height: 30)
        nameLabel.text = "9yubean2"
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        nameLabel.backgroundColor = .clear
        
        emailLabel.frame = CGRect(x: 70, y: 30, width: 100, height: 30)
        emailLabel.text = "mail@gmail.com"
        emailLabel.textColor = .white
        emailLabel.font = UIFont.systemFont(ofSize: 11)
        emailLabel.backgroundColor = .clear
        
        //테이블 뷰 상단에 표시될 뷰 정의
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
        headerView.backgroundColor = UIColor(red: 255/255, green: 196/255, blue: 126/255, alpha: 1)
        
        //생성한 뷰를 테이블 헤더 뷰 영역에 등록
        tableView.tableHeaderView = headerView
//        tableView.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: CGFloat.leastNonzeroMagnitude))
   
        headerView.addSubview(profileImage)
        headerView.addSubview(nameLabel)
        headerView.addSubview(emailLabel)
        
        
        
    }
    
    //MARK: - TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //재사용 큐로부터 테이블 셀을 꺼내온다.
        let id = "menucell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id)

        //타이틀과 아이콘 대입
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]
        
        //폰트 설정
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //첫번째 메뉴
        if indexPath.row == 0 {
            //프론트 컨트롤러의 참조 정보를 읽어온 후 화면 전환
            let uv = self.storyboard?.instantiateViewController(withIdentifier: "MemoForm")
            let target = self.revealViewController().frontViewController as! UINavigationController
            target.pushViewController(uv!, animated: true)
            //사이드 바 닫기
            self.revealViewController().revealToggle(self)
        }  else if indexPath.row == 5 {
            //프론트 컨트롤러의 참조 정보를 읽어온 후 화면 전환
            let uv = self.storyboard?.instantiateViewController(withIdentifier: "_Profile")
            uv?.modalPresentationStyle = .fullScreen
            self.present(uv!, animated: true) {
                self.revealViewController().revealToggle(self)
            }
        }
    }
}
