//
//  CSStepper.swift
//  CSTabBar
//
//  Created by 이규빈 on 2022/05/06.
//

import UIKit
@IBDesignable
public class CSStepper: UIControl {
    
    public var leftBtn = UIButton(type: .system)
    public var centerLabel = UILabel()
    public var rightBtn = UIButton(type: .system)
    //스태퍼 값 저장할 변수
    @IBInspectable
    public var value: Int = 0 {
        didSet {
            self.centerLabel.text = String(value)
            
            //이 클래스를 사용하는 객체들에게 vlaueChanged 이벤트 신호를 준다
            self.sendActions(for: .valueChanged)
        }
    }
    @IBInspectable
    public var leftTitle: String = "↓" {
        didSet{
            self.leftBtn.setTitle(leftTitle, for: .normal)
        }
    }

    @IBInspectable
    public var rightTitle: String = "↑" {
        didSet{
            self.rightBtn.setTitle(rightTitle, for: .normal)
        }
    }
    
    @IBInspectable
    public var bgColor: UIColor = UIColor.cyan {
        didSet{
            self.centerLabel.backgroundColor = backgroundColor
        }
    }
    
    //증감값 단위
    @IBInspectable
    public var stepValue: Int = 1
    
    @IBInspectable public var maximumValue: Int = 100
    @IBInspectable public var minimumValue: Int = -100
    
    //스토리보드에서 호출할 초기화 메소드
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    //프로그래밍 방식으로 호출할 초기화 메소드
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    private func setup() {
        
        let borderWidth: CGFloat = 0.5
        let borderColor = UIColor.blue.cgColor
        
        //스태퍼 기본 속성 설정
        self.leftBtn.tag = -1
//        self.leftBtn.setTitle("↓", for: .normal)
        self.leftBtn.setTitle(self.leftTitle, for: .normal)
        self.leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.leftBtn.layer.borderWidth = borderWidth
        self.leftBtn.layer.borderColor = borderColor
        self.leftBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        
        self.rightBtn.tag = 1
//        self.rightBtn.setTitle("↑", for: .normal)
        self.rightBtn.setTitle(self.rightTitle, for: .normal)
        self.rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.rightBtn.layer.borderWidth = borderWidth
        self.rightBtn.layer.borderColor = borderColor
        self.rightBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        
        self.centerLabel.text = String(value)
        self.centerLabel.font = UIFont.systemFont(ofSize: 16)
        self.centerLabel.textAlignment = .center
//        self.centerLabel.backgroundColor = .cyan
        self.centerLabel.backgroundColor = self.bgColor
        self.centerLabel.layer.borderWidth = borderWidth
        self.centerLabel.layer.borderColor = borderColor
        
        self.addSubview(self.leftBtn)
        self.addSubview(self.rightBtn)
        self.addSubview(self.centerLabel)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        //버튼의 너비 = 뷰 높이
        let btnWidth = self.frame.height
        //레이블의 너비 = 뷰 높이 - 버튼 두개 너비 합
        let lblWidth = self.frame.width - (btnWidth * 2)
        
        self.leftBtn.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnWidth)
        self.centerLabel.frame = CGRect(x: btnWidth, y: 0, width: lblWidth, height: btnWidth)
        self.rightBtn.frame = CGRect(x: btnWidth + lblWidth, y: 0, width: btnWidth, height: btnWidth)
        
    }
    
    @objc public func valueChange(_ sender: UIButton) {
//        self.value += sender.tag
        //스태퍼 값 변경 전 최소값최대값 체크
        let sum = self.value + (sender.tag * self.stepValue)
        
        if sum > self.maximumValue {
            return
        }
        if sum < self.minimumValue {
            return
        }
        self.value += (sender.tag * self.stepValue)
    }
}

