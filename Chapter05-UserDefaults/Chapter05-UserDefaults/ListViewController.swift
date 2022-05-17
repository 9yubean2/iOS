//
//  ListViewController.swift
//  Chapter05-UserDefaults
//
//  Created by 이규빈 on 2022/05/16.
//

import UIKit

class ListViewController: UITableViewController {

    //MARK: - Properties
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var maritalStatus: UISwitch!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let plist = UserDefaults.standard
        
        self.name.text = plist.string(forKey: "name")
        self.gender.selectedSegmentIndex = plist.integer(forKey: "gender")
        self.maritalStatus.isOn = plist.bool(forKey: "maritalStatus")
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

}
