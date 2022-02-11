//
//  ViewController.swift
//  DatePicker
//
//  Created by 이규빈 on 2022/01/10.
//

import UIKit

class DateViewController: UIViewController {
    
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    let interval = 1.0 //타이머 간격 값
    var count = 0

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
       // lblCurrentTime.text = String(count)
       // count = count + 1
        
        let date = NSDate() //현재 시간 함수
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
    }
    
}

