//
//  ViewController.swift
//  Sketch
//
//  Created by 이규빈 on 2022/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var txtWidth: UITextField!
    
    var lastPoint: CGPoint!
    var lineSize: CGFloat = 2.0
    var lineColor = UIColor.black.cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtWidth.text = String(Int(lineSize))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        lastPoint = touch.location(in: imgView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        let currPoint = touch.location(in: imgView)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.width, height: imgView.frame.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoint = currPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.width, height: imgView.frame.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }

    //기기 흔들었을 때 초기화
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            imgView.image = nil
        }
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        imgView.image = nil
    }
    @IBAction func btnBlack(_ sender: UIButton) {
        lineColor = UIColor.black.cgColor
    }
    
    @IBAction func btnRed(_ sender: UIButton) {
        lineColor = UIColor.red.cgColor
    }
    
    @IBAction func btnGreen(_ sender: UIButton) {
        lineColor = UIColor.green.cgColor
    }
    
    @IBAction func btnBlue(_ sender: UIButton) {
        lineColor = UIColor.blue.cgColor
    }
    
    //텍스트필드 값 보내는 버튼 없을 때 값 내보내는 방법
    @IBAction func txtEditChanged(_ sender: UITextField) {
        if txtWidth.text != ""{
            lineSize = CGFloat(Int(txtWidth.text!)!)
        }
    }
    
    @IBAction func txtDidEndOnExit(_ sender: UITextField) {
        lineSize = CGFloat(Int(txtWidth.text!)!)
    }
    
    
    @IBAction func txtTouchDown(_ sender: UITextField) {
        txtWidth.selectAll(UITextField.self)
    }
}
