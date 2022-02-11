//
//  ViewController.swift
//  Navigation
//
//  Created by 이규빈 on 2022/01/15.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "light_on.png")
    let imgOff = UIImage(named: "light_off.png")
    
    var isOn = true
    var isZoom = false
    var orgZoom = false //이건 뭐지?
    
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    
    //세그웨이 사용해 화면 전환
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            //버튼을 클릭한 경우
            editViewController.textWayValue = "segue: use Button"
        } else if segue.identifier == "editBarButton" {
            //바 버튼을 클릭한 경우
            editViewController.textWayValue = "segue: use Bar Button"
        }
        //Edit 화면으로 텍스트 메시지와 전구 상태 전달
        editViewController.textMessage = txtMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = orgZoom
        editViewController.delegate = self
    }

    //메시지 값을 텍스트 필드에 표시
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    
    //전구 이미지 값 세팅
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    //이미지 확대 축소 세팅
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        if isZoom {
            if orgZoom {
                
            } else {
                self.isZoom = false
                self.orgZoom = true //아니 이거 뭐냐고ㅜ
                newWidth = imgView.frame.width*scale
                newHeight = imgView.frame.height*scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            }
           
            print("Zoom: true")
        } else {
            if orgZoom {self.isZoom = true
                self.orgZoom = false
                newWidth = imgView.frame.width/scale
                newHeight = imgView.frame.height/scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            } else{
                
            }
            
            print("Zoom: false")
        }
    }
        
}

