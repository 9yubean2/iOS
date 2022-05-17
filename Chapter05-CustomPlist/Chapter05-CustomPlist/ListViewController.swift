//
//  ListViewController.swift
//  Chapter05-CustomPlist
//
//  Created by 이규빈 on 2022/05/16.

import UIKit

class ListViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //MARK: - Properties
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var maritalStatus: UISwitch!
    @IBOutlet weak var account: UITextField!
    
    var accountlist = [String]()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        //super.viewDidLoad()
        let picker = UIPickerView()
        self.account.inputView = picker
        picker.delegate = self
        picker.dataSource = self
        
        //tool bar
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: 0, height: 35)
        toolbar.barTintColor = .lightGray
        self.account.inputAccessoryView = toolbar
        
        //Flexible Space Bar Button Item
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        //Done Button im toolbar
        let done = UIBarButtonItem()
        done.title = "Done"
        done.target = self
        done.action = #selector(pickerDone)
        
        //Button to Regist New Account
        let new = UIBarButtonItem()
        new.title = "New"
        new.target = self
        new.action = #selector(newAccount)
        
        toolbar.setItems([new,flexSpace,done], animated: true)
        
        
    }
    
    //MARK: - Action
    
    @IBAction func edit(_ sender: UITapGestureRecognizer) {
        //show alert for input
        let alert = UIAlertController(title: nil, message: "WHAT'S YOUR NAME?🧐", preferredStyle: .alert)
        alert.addTextField() {
            $0.text = self.name.text
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
            //Save the Value
            let value = alert.textFields?[0].text
            let plist = UserDefaults.standard
            plist.set(value, forKey:"name")
            plist.synchronize()
            self.name.text = value
        })
        
        self.present(alert, animated: false, completion: nil)
    
    }
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex
        let plist = UserDefaults.standard
        plist.set(value, forKey:"gender")
        plist.synchronize()
    }
    @IBAction func changeMaritalStatus(_ sender: UISwitch) {
        let value = sender.isOn
        let plist = UserDefaults.standard
        plist.set(value, forKey:"maritalStatus")
        plist.synchronize()
    }
    
    @objc func pickerDone(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @objc func newAccount(_ sender: Any) {
        self.view.endEditing(true)
        //show alert for input
        let alert = UIAlertController(title: nil, message: "WHAT'S YOUR ACCOUNT?🧐", preferredStyle: .alert)
        alert.addTextField() {
            $0.placeholder = "ex) abc@gmail.com"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
            //Save the Value
            if let account = alert.textFields?[0].text{
                self.accountlist.append(account)
                self.account.text = account
                //refresh all control value
                self.name.text = ""
                self.gender.selectedSegmentIndex = 0
                self.maritalStatus.isOn = false
                //Save
                let plist = UserDefaults.standard
                plist.set(self.accountlist, forKey: "accountlist")
                plist.set(account, forKey: "selectedAccount")
                plist.synchronize()
            }
            
        })
        
        self.present(alert, animated: false, completion: nil)
    }
    
    // MARK: - Helper

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return super.numberOfSections(in: tableView)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return super.tableView(tableView, numberOfRowsInSection: section)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0 {
//            //first row is taaped
//            //show alert for input
//            let alert = UIAlertController(title: nil, message: "WHAT'S YOUR NAME?🧐", preferredStyle: .alert)
//            alert.addTextField() {
//                $0.text = self.name.text
//            }
//            alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
//                //Save the Value
//                let value = alert.textFields?[0].text
//                let plist = UserDefaults.standard
//                plist.set(value, forKey:"name")
//                plist.synchronize()
//                self.name.text = value
//            })
//
//            self.present(alert, animated: false, completion: nil)
//        }
    }
    
    //MARK: - Picker
    //생성할 컴포넌트의 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // 지정된 컴포넌트가 가질 목록의 길이
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.accountlist.count
    }
    // 지정된 컴포넌트의 목록 각 행에 출력될 내용 정의
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.accountlist[row]
    }
    // 지정된 컴포넌트의 목록 각 행을 사용자가 선택했을 때 실핼할 액션 정의
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //선택된 계정값을 텍스트 필드에 입력
        let account = self.accountlist[row]
        self.account.text = account
        //입력 뷰 닫음
        //move to pickerDone
        //self.view.endEditing(true)
        //Save
        let plist = UserDefaults.standard
        plist.set(account, forKey: "selectedAccount")
        plist.synchronize()
    }

}
