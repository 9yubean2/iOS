//
//  CSButton.swift
//  CSButton
//
//  Created by 이규빈 on 2022/05/06.
//

import UIKit

public enum CSButtonType {
    case rect
    case circle
}

class CSButton: UIButton {

    required init(coder aDecoder: NSCoder) {
        //스토리보드 방식으로 객체를 생성할 때 호출되는 초기화 메소드
        super.init(coder: aDecoder)!
        
        //스토리보드 방식으로 버튼을 정의했을 때 적용
        self.backgroundColor = .green
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("CSButton", for: .normal)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.backgroundColor = .gray
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("CodeBaseButton", for: .normal)
        
    }
    init() {
        super.init(frame: CGRect.zero)
    }
    convenience init(type: CSButtonType) {
        self.init()
        
        switch type {
        case .rect:
            self.backgroundColor = .black
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 0
            self.layer.borderColor = UIColor.black.cgColor
            self.setTitleColor(UIColor.white, for: .normal)
            self.setTitle("Rect Button", for: .normal)
        case .circle:
            self.backgroundColor = .red
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 50
            self.layer.borderColor = UIColor.blue.cgColor
            
            self.setTitle("Circle Button", for: .normal)
        }
        self.addTarget(self, action: #selector(counting(_:)), for: .touchUpInside)
    }
    
    var style:CSButtonType = .rect {
        didSet{
            switch style {
            case .rect:
                self.backgroundColor = .black
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 0
                self.layer.borderColor = UIColor.black.cgColor
                self.setTitleColor(UIColor.white, for: .normal)
                self.setTitle("Rect Button", for: .normal)
            case .circle:
                self.backgroundColor = .red
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 50
                self.layer.borderColor = UIColor.blue.cgColor
                
                self.setTitle("Circle Button", for: .normal)
            }
        }
    }
    
    @objc func counting(_ sender: UIButton) {
        sender.tag = sender.tag + 1
        sender.setTitle("\(sender.tag) 번째 클릭", for: .normal)
    }
}
