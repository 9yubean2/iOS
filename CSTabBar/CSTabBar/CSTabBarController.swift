//
//  CSTabBarController.swift
//  CSTabBar
//
//  Created by 이규빈 on 2022/05/06.
//

import UIKit

class CSTabBarController: UITabBarController {
    let csView = UIView()
    let tabItem1 = UIButton(type: .system)
    let tabItem2 = UIButton(type: .system)
    let tabItem3 = UIButton(type: .system)
    override func viewDidLoad() {
        //초기 화면을 first view로 세팅
        self.onTabBarItemClick(self.tabItem1)
        //원래 탭바 숨김
        self.tabBar.isHidden = true
        
        //새로운 탭바
        let width = self.view.frame.width
        let height: CGFloat = 80
    
        let x: CGFloat = 0
        let y = self.view.frame.height - height
        
        self.csView.frame = CGRect(x: x, y: y, width: width, height: height)
        self.csView.backgroundColor = .brown
        
        self.view.addSubview(self.csView)
        
        //새로운 탭바 아이템
        let tabBtnWidth = self.csView.frame.size.width / 3
        let tabBarHeight = self.csView.frame.size.height
        
        self.tabItem1.frame = CGRect(x: 0, y: 0, width: tabBtnWidth, height: tabBarHeight)
        self.tabItem2.frame = CGRect(x: tabBtnWidth, y: 0, width: tabBtnWidth, height: tabBarHeight)
        self.tabItem3.frame = CGRect(x: tabBtnWidth * 2, y: 0, width: tabBtnWidth, height: tabBarHeight)
        self.addTabBarBtn(btn: self.tabItem1, title: "firstBtn", tag: 0)
        self.addTabBarBtn(btn: self.tabItem2, title: "secondBtn", tag: 1)
        self.addTabBarBtn(btn: self.tabItem3, title: "thirdBtn", tag: 2)
        
        
        
    }
    func addTabBarBtn(btn: UIButton, title: String, tag: Int) {
        //버튼의 타이틀과 태그값 입력
        btn.setTitle(title, for: .normal)
        btn.tag = tag
        
        //일반 버튼 텍스트 색상
        btn.setTitleColor(UIColor.white, for: .normal)
        //선택된 버튼 텍스트 색상
        btn.setTitleColor(UIColor.yellow, for: .selected)
        
        btn.addTarget(self, action: #selector(onTabBarItemClick(_:)), for: .touchUpInside)
        
        self.csView.addSubview(btn)
    }
    
    @objc func onTabBarItemClick(_ sender: UIButton) {
        //모든 버튼 초기화
        self.tabItem1.isSelected = false
        self.tabItem2.isSelected = false
        self.tabItem3.isSelected = false
        
        //인자값으로 입력된 버튼만 선택된 상태로 변경
        sender.isSelected = true
        self.selectedIndex = sender.tag
    }
}
