//
//  HomeViewController.swift
//  clonestagram
//
//  Created by 이규빈 on 2022/04/29.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var arrayImage : [FeedModel] = []
    let imagePicker = UIImagePickerController()
       
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        self.tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        self.tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        //API
        let input = FeedAPIInput(limit: 10, page: 0)
        FeedDataManager().FeedDataManager(input, self)
    }
   

    @IBAction func btnUploadImage(_ sender: Any) {
        print("btnUploadImage is Tapped")
        self.imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
}

// MARK: - Extension
extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10
        return arrayImage.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
                return UITableViewCell()
            }
            if let urlString = arrayImage[indexPath.row - 1].url{
                let url = URL(string: urlString)
                cell.imageViewFeed.kf.setImage(with: url)
            }
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return 75
        } else {
            return 640
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? StoryTableViewCell else {
            return
        }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 62, height: 70)
    }
    
}

extension HomeViewController {
    func successAPI(_ result: [FeedModel]){
        arrayImage = result
        tableView.reloadData()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let imageString = "https://firebasestorage.googleapis.com/v0/b/catstargram-d7fbf.appspot.com/o/Cat1?alt=media&token=e92d1af6-ceb3-4a0c-9ba9-acd5cf534a42"
            let input = FeedUploadInput(content: "상이는 참 귀엽네요", postImgsUrl: [imageString])
            FeedUploadDataManager().posts(self, input)
            
            self.dismiss(animated: true, completion: nil)
        }
    }
}
