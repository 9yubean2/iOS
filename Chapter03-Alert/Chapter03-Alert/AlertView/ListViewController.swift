//
//  ListViewController.swift
//  Chapter03-Alert
//
//  Created by 이규빈 on 2022/05/01.
//

import UIKit

class ListViewController: UITableViewController {
    
    var delegate : ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize.height = 220
        
    }

    // MARK: - Table view

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel!.text = "Option\(indexPath.row)"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectRowAt(indexPath: indexPath)
    }



}
