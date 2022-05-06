//
//  FrontViewController.swift
//  SideBarDIY
//
//  Created by 이규빈 on 2022/05/07.
//

import UIKit

class FrontViewController: UIViewController {
    //MARK: - Properties
    //사이드바 오픈 기능을 위임할 델리게이트
    var delegate : RevealViewController?
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //사이드바 오픈용 버튼 정의
        let btnSideBar = UIBarButtonItem(image: UIImage(named: "sidemenu.png"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(moveSide(_:)))
        
        //버튼을 네비게이션바 왼쪽에 추가
        self.navigationItem.leftBarButtonItem = btnSideBar
        
        //화면 끝에서 다른쪽으로 패닝하는 제스처 정의
        let dragLeft = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        dragLeft.edges = UIRectEdge.left//시작모서리는 왼쪽
        //화면을 스와이프하는 제스처 정의(사이드 메뉴 닫기용)
        let dragRight = UISwipeGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        dragRight.direction = .left //방향은 왼쪽

        self.view.addGestureRecognizer(dragLeft)//뷰에 제스처 객체를 등록
        self.view.addGestureRecognizer(dragRight)//뷰에 제스처 객체를 등록
    }
    //MARK: - Helper
    @objc func moveSide(_ sender: Any){
        if sender is UIScreenEdgePanGestureRecognizer {
            self.delegate?.openSideBar(nil) //사이드바를 연다
        } else if sender is UISwipeGestureRecognizer {
            self.delegate?.closeSideBar(nil) //사이드바를 닫는다
        } else if sender is UIBarButtonItem {
            if self.delegate?.isSideBarShowing == false {
                self.delegate?.openSideBar(nil) //사이드바를 연다
            } else {
                self.delegate?.closeSideBar(nil) //사이드바를 닫는다
            }
        }
        
    }
}
