//
//  CSLogButton.swift
//  MyMemory
//
//  Created by 이규빈 on 2022/05/07.
//

import UIKit

public enum CSLogType: Int {
    case basic //기본 로그 타입
    case title //버튼의 타이틀을 출력
    case tag //버튼의 태그값 출력
}

class CSLogButton: UIButton {
    
    //로그 출력 타입
    public var logType: CSLogType = .basic
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //버튼에 스타일 적용
        self.setBackgroundImage(UIImage(named: "Rectangle 1"), for: .normal)
        self.tintColor = .white
        
        //클릭 이벤트에 logging 메소드 적용
        self.addTarget(self, action: #selector(logging(_:)), for: .touchUpInside)
    }
    
    //로그 출력 메소드
    @objc func logging(_ sender: UIButton) {
        switch self.logType {
        case .basic: //기본 로그 출력
            NSLog("Button is Selected")
        case .title:
            let btnTitle = sender.titleLabel?.text ?? "Untitled"
            NSLog("\(btnTitle)Button is Selected")
        case .tag:
            NSLog("\(sender.tag)Button is Selected")
        }
    }
}
