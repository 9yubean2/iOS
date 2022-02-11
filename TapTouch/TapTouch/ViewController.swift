//
//  ViewController.swift
//  TapTouch
//
//  Created by 이규빈 on 2022/01/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtMessage: UILabel!
    @IBOutlet var lblTapCount: UILabel!
    @IBOutlet var lblTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch //현재 발생한 터치 이벤트를 가져옴
        txtMessage.text = "Touches Began" // 현재 발생한 이벤트의 종류를 출력 (메서드마다 내용 상이)
        lblTapCount.text = String(touch.tapCount) //터치 객체 중 탭의 개수 출력
        lblTouchCount.text = String(touches.count) //터치 개수 출력
    
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches Moved"
        lblTapCount.text = String(touch.tapCount)
        lblTouchCount.text = String(touches.count)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches Ended"
        lblTapCount.text = String(touch.tapCount)
        lblTouchCount.text = String(touches.count)
    }


}

