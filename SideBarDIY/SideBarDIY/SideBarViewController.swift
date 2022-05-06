//
//  SideBarViewController.swift
//  SideBarDIY
//
//  Created by 이규빈 on 2022/05/07.
//

import UIKit

class SideBarViewController: UITableViewController {
    
    //MARK: - Properties
    //메뉴 제목 배열
    let titles = [
        "menu01",
        "menu02",
        "menu03",
        "menu04",
        "menu05",
    ]
    //메뉴 아이콘 배열
    let icons = [
        UIImage(named: "icon01"),
        UIImage(named: "icon02"),
        UIImage(named: "icon03"),
        UIImage(named: "icon04"),
        UIImage(named: "icon05"),
    ]
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //계정 정보를 표시할 레이블 객체 정의
        let accountLabel = UILabel()
        accountLabel.frame = CGRect(x: 10, y: 30, width: self.view.frame.width, height: 30)
        accountLabel.text = "mail@gmail.com"
        accountLabel.textColor = .white
        accountLabel.font = UIFont.systemFont(ofSize: 15)
        
        //테이블 뷰 상단에 표시될 뷰 정의
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70)
        v.backgroundColor = .brown
        v.addSubview(accountLabel)
        
        //생성한 뷰를 테이블 헤더 뷰 영역에 등록
        self.tableView.tableHeaderView = v
    }
    
    //MARK: - TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //재사용 큐로부터 테이블 셀을 꺼내온다.
        let id = "menucell"
//        let cell = UITableViewCell() //재사용 큐 대신에 매번 셀을 새로 생성 이는 셀이 많아지면 성능과 메모리 안정성을 보장하기 위해 제한적 사용해야 함을 명시
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id) //이게 best code!
        
        //재사용 큐에 menucell키로 등록된 테이블 뷰 셀이 없다면 새로 추가한다.
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: id)
//        }
        
        //타이틀과 아이콘 대입
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]
        
        //폰트 설정
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        return cell
    }
    
}
