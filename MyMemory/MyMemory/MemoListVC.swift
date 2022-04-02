//
//  MemoListVC.swift
//  MyMemory
//
//  Created by 이규빈 on 2022/03/29.
//

import UIKit

class MemoListVC: UITableViewController {

    let appDelegatae = UIApplication.shared.delegate as! AppDelegate
    override func viewWillAppear(_ animate: Bool) {
        self.tableView.reloadData()

    }

    // MARK: - Table view data source

//Decide number of table row
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.appDelegatae.memolist.count
        return count
    }
//compose table row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.appDelegatae.memolist[indexPath.row]
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! Memocell
        
        cell.title?.text = row.title
        cell.contents?.text = row.content
        cell.img?.image = row.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.regdate?.text = formatter.string(from: row.regdate!)

        return cell
    }

//select table row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //get
        let row = self.appDelegatae.memolist[indexPath.row]
        //instance
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else {
            return
        }
        //detail view
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
