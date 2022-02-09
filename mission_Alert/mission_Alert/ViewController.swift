//
//  ViewController.swift
//  mission_Alert
//
//  Created by 이규빈 on 2022/01/11.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var alarmTime: String?
    var alertFlag = false //정답 참고

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblSelectedTime: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePickek(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblSelectedTime.text = formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        if (alarmTime == currentTime) {
            if !alertFlag { //정답 참고
                let timeAlert = UIAlertController(title: "Alert", message: "It's setting time!", preferredStyle: UIAlertController.Style.alert)
                let onAction = UIAlertAction(title: "Ok, I got it.", style: UIAlertAction.Style.default, handler: nil)
                timeAlert.addAction(onAction)
                present(timeAlert, animated: true, completion: nil)
                alertFlag = true
            }
        }
        else { //정답 참고
            alertFlag = false
        }
    }
    
}

