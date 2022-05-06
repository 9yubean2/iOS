//
//  RevealViewController.swift
//  SideBarDIY
//
//  Created by 이규빈 on 2022/05/07.
//

import UIKit

class RevealViewController: UIViewController {

    //MARK: - Properties
    var contentVC: UIViewController?//콘텐츠 뷰
    var sideVC: UIViewController?//사이드바 메뉴 뷰
    
    var isSideBarShowing = false //사이드바 열려있는지 여부
    
    let SLIDE_TIME = 0.3 //사이드바 열리고 닫히는데 걸리는 시간
    let SIDEBAR_WIDTH: CGFloat = 260 //사이드바 영역
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    //MARK: - Method
    
    //초기화면
    func setupView(){
        //_프론트 컨트롤러 객체 읽어오기
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_front") as? UINavigationController {
            //읽어온 컨트롤러를 클래스 전체에서 참조할 수 있도록 contentVC 속성에 저장
            self.contentVC = vc
            //_프론트 컨트롤러 객체를 메인 컨트롤러의 자식으로 등록
            self.addChild(vc)
            self.view.addSubview(vc.view)
            //_프론트 컨트롤러에 부모 뷰 컨트롤러가 바뀌었음을 알려준다
            vc.didMove(toParent: self)
            //프론트 컨트롤러의 델리게이트 변수에 참조 정보를 넣어준다.
            let frontVC = vc.viewControllers[0] as? FrontViewController
            frontVC?.delegate = self
        }
    }
    
    //사이드바의 뷰를 읽어온다.
    func getSideView() {
        guard self.sideVC == nil else {
            return
        }
        
        //사이드바 컨트롤러 객체를 읽어온다
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_rear") else {
            return
        }
        
        //다른 메소드에서도 참조할 수 있도록 sideVC속성에 저장
        self.sideVC = vc
        
        //읽어온 사이드 바 컨트롤러 객체를 컨테이너 뷰 컨트롤러에 연결
        self.addChild(vc)
        self.view.addSubview(vc.view)
        
        //_프론트 컨트롤러에 부모 뷰 컨트롤러가 바뀌었음을 알려준다
        vc.didMove(toParent: self)
        
        //_프론트 컨트롤러의 뷰를 제일 위로 올린다.
        self.view.bringSubviewToFront((self.contentVC?.view)!)
        
        
    }
    //콘텐츠뷰에 그림자 효과
    func setShadowEffect(shadow: Bool, offset: CGFloat) {
        if (shadow == true) {
            self.contentVC?.view.layer.masksToBounds = false
            self.contentVC?.view.layer.cornerRadius = 10
            self.contentVC?.view.layer.shadowOpacity = 0.8
            self.contentVC?.view.layer.shadowColor = UIColor.black.cgColor
            self.contentVC?.view.layer.shadowOffset = CGSize(width: offset, height: offset)
        } else {
            self.contentVC?.view.layer.cornerRadius = 0.0
            self.contentVC?.view.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    //사이드바를 연다.
    func openSideBar(_ complete: (() -> Void)?) {
        //앞에서 정의한 메소드 실행
        self.getSideView()
        self.setShadowEffect(shadow: true, offset: -2)
        
        //애니메이션 옵션
        let options = UIView.AnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        //애니메이션 실행
        UIView.animate(
            withDuration: (self.SLIDE_TIME),
            delay: TimeInterval(0),
            options: options,
            animations: {
                self.contentVC?.view.frame =
                CGRect(x: self.SIDEBAR_WIDTH, y: 0,
                       width: self.view.frame.width, height: self.view.frame.height)
        },
            completion: {
                if $0 == true {
                    self.isSideBarShowing = true //열림상태로 플래그를 변경
                    complete?()
                }
            })
    }
    
    //사이드바를 닫는다.
    func closeSideBar(_ complete: (() -> Void)?) {
        //애니메이션 옵션
        let options = UIView.AnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        //애니메이션 실행
        UIView.animate(
            withDuration: (self.SLIDE_TIME),
            delay: TimeInterval(0),
            options: options,
            animations: {
                //옆으로 밀려낭 콘텐츠 뷰의 위치를 제자리로
                self.contentVC?.view.frame =
                CGRect(x: 0, y: 0,
                       width: self.view.frame.width, height: self.view.frame.height)
        },
            completion: {
                if $0 == true {
                    //사이드바 뷰를 제거
                    self.sideVC?.view.removeFromSuperview()
                    self.sideVC = nil
                    
                    //닫힘상태로 플래그를 변경
                    self.isSideBarShowing = false
                    
                    //그림자효과 제거
                    self.setShadowEffect(shadow: false, offset: 0)
                    
                    complete?()
                }
            })
        
    }
}
