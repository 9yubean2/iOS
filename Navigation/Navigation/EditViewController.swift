//
//  EditViewController.swift
//  Navigation
//
//  Created by 이규빈 on 2022/01/15.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {

    
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate : EditDelegate?
    var isOn = false
    var isZoom = false
    
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var swlsOn: UISwitch!
    @IBOutlet var btnZoom: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txtMessage.text = textMessage
        swlsOn.isOn = isOn
        if isZoom {
            btnZoom.setTitle("Zoom In", for: UIControl.State())
        } else {
            btnZoom.setTitle("Zoom Out", for: UIControl.State())
        }
    }
    
    //main 화면으로 텍스트와 전구 이미지 상태 보내기
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txtMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageZoomDone(self, isZoom: isZoom)
        }
        //main 화면으로 이동
        _ = navigationController?.popViewController(animated: true)
    }
    
    //전구 켜고 끄기
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    //전구 확대 축소
    @IBAction func btnResize(_ sender: UIButton) {
        if isZoom {
            isZoom = false
            btnZoom.setTitle("Zoom Out", for: .normal)
        } else {
            isZoom = true
            btnZoom.setTitle("Zoom In", for: .normal)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
