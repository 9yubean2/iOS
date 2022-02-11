//
//  ViewController.swift
//  DrawGraphics
//
//  Created by 이규빈 on 2022/01/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLine(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size) //콘텍스트를 이미지뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()! //생성한 콘텍스트의 정보 가져오기
        
        //Draw Line
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 70, y: 50))
        context.addLine(to: CGPoint(x: 270, y: 250))
        
        context.strokePath()
        
        //Draw Triangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 270, y: 350))
        context.addLine(to: CGPoint(x: 70, y: 350))
        context.addLine(to: CGPoint(x: 170, y: 200))
        
        context.strokePath()
        
        //콘텍스트에 그려진 이미지를 이미지뷰로 가져옴
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        //그림 그리기를 끝내기
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnSquare(_ sender: UIButton) {
        
        UIGraphicsBeginImageContext(imgView.frame.size) //콘텍스트를 이미지뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()! //생성한 콘텍스트의 정보 가져오기
        
        //Draw Rectangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addRect(CGRect(x: 70, y: 100, width: 200, height: 200))
        
        context.strokePath()
        
        //콘텍스트에 그려진 이미지를 이미지뷰로 가져옴
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        //그림 그리기를 끝내기
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnCircle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size) //콘텍스트를 이미지뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()! //생성한 콘텍스트의 정보 가져오기
        
        //Draw Ellipse
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addEllipse(in: CGRect(x: 70, y: 50, width: 200, height: 100))
        
        context.strokePath()
        
        //Draw Circle
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.green.cgColor)
        
        context.addEllipse(in: CGRect(x: 70, y: 200, width: 200, height: 200))
        
        context.strokePath()
        //콘텍스트에 그려진 이미지를 이미지뷰로 가져옴
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        //그림 그리기를 끝내기
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnArc(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size) //콘텍스트를 이미지뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()! //생성한 콘텍스트의 정보 가져오기
        
        //Draw Arc
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 100, y: 50))
        context.addArc(tangent1End: CGPoint(x: 250, y: 50), tangent2End: CGPoint(x: 250, y: 200), radius: CGFloat(50))
        context.addLine(to: CGPoint(x: 250, y: 200))
        
        context.move(to: CGPoint(x: 100, y: 250))
        context.addArc(tangent1End: CGPoint(x: 270, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x: 100, y: 400))
        
        context.strokePath()
    
        //콘텍스트에 그려진 이미지를 이미지뷰로 가져옴
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        //그림 그리기를 끝내기
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnFill(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw Rectangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.setFillColor(UIColor.red.cgColor)
        
        let rectangle = CGRect(x: 70, y: 50, width: 200, height: 100)
        context.addRect(rectangle)
        context.fill(rectangle)
        context.strokePath()
        
        //Draw Circle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setFillColor(UIColor.blue.cgColor)
        
        let circle = CGRect(x: 70, y: 200, width: 200, height: 100)
        context.addEllipse(in: circle)
        context.fillEllipse(in: circle)
        context.strokePath()
        
        //Draw Triangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 350))
        context.addLine(to: CGPoint(x: 270, y: 450))
        context.addLine(to: CGPoint(x: 70, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 350))
        context.fillPath()
        context.strokePath()
        
        //콘텍스트에 그려진 이미지를 이미지뷰로 가져옴
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        //그림 그리기를 끝내기
        UIGraphicsEndImageContext()
        
    }
    @IBAction func btnIMG(_ sender: UIButton) {
        
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw flower triangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 200, y: 450))
        context.addLine(to: CGPoint(x: 140, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 200))
        context.fillPath()
        context.strokePath()
        
        //Draw flower circle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.yellow.cgColor)
        
        context.addEllipse(in: CGRect(x: 120, y: 150, width: 100, height: 100))
        
        context.strokePath()
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addEllipse(in: CGRect(x: 170, y: 150, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: 70, y: 150, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: 120, y: 100, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: 120, y: 200, width: 100, height: 100))
        
        context.strokePath()
        
        //콘텍스트에 그려진 이미지를 이미지뷰로 가져옴
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        //그림 그리기를 끝내기
        UIGraphicsEndImageContext()
    }
}

