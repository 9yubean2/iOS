//
//  MemoListVC.swift
//  MyMemory
//
//  Created by 이규빈 on 2022/03/29.
//

import UIKit

class MemoListVC: UITableViewController {

    let appDelegatae = UIApplication.shared.delegate as! AppDelegate
    override func viewWillAppear(_ animate: Bool) {
        self.tableView.reloadData()

    }
    override func viewDidLoad() {
        //SWRevealviewController 라이브러리의 revealViewController 객체를 읽어온다.
        if let revealVC = self.revealViewController() {
            //바버튼 아이템 객체를 정의
            let btn = UIBarButtonItem()
            btn.image = UIImage(named: "sidemenu.png")
            btn.target = revealVC
            btn.action = #selector(revealVC.revealToggle(_:))
            self.navigationItem.leftBarButtonItem = btn
            
            //화면 끝에서 다른쪽으로 패닝하는 제스처 정의
//            let dragLeft = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(moveSide(_:)))
//            dragLeft.edges = UIRectEdge.left//시작모서리는 왼쪽
            //화면을 스와이프하는 제스처 정의(사이드 메뉴 닫기용)
//            let dragRight = UISwipeGestureRecognizer(target: self, action: #selector(moveSide(_:)))
//            dragRight.direction = .left //방향은 왼쪽

            self.view.addGestureRecognizer(revealVC.panGestureRecognizer())//뷰에 제스처 객체를 등록
//            self.view.addGestureRecognizer(dragRight)//뷰에 제스처 객체를 등록
        }
        
    }

    // MARK: - Table view data source

//Decide number of table row
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.appDelegatae.memolist.count
        return count
    }
//compose table row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.appDelegatae.memolist[indexPath.row]
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! Memocell
        
        cell.title?.text = row.title
        cell.contents?.text = row.content
        cell.img?.image = row.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.regdate?.text = formatter.string(from: row.regdate!)

        return cell
    }

//select table row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //get
        let row = self.appDelegatae.memolist[indexPath.row]
        //instance
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else {
            return
        }
        //detail view
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Helper
//    @objc func moveSide(_ sender: Any){
//        if sender is UIScreenEdgePanGestureRecognizer {
//            self.delegate?.openSideBar(nil) //사이드바를 연다
//        } else if sender is UISwipeGestureRecognizer {
//            self.delegate?.closeSideBar(nil) //사이드바를 닫는다
//        } else if sender is UIBarButtonItem {
//            if self.delegate?.isSideBarShowing == false {
//                self.delegate?.openSideBar(nil) //사이드바를 연다
//            } else {
//                self.delegate?.closeSideBar(nil) //사이드바를 닫는다
//            }
//        }
//
//    }
    
}
