//
//  ProfileViewController.swift
//  clonestagram
//
//  Created by 이규빈 on 2022/04/30.
//
import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {

    //MARK: - Properties
    
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    var userPosts: [GetUserPosts]? {
        didSet { self.profileCollectionView.reloadData()}
    }
    
    var deletedIdx : Int?
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileCollectionview()
        setupData()
    }
    
    //MARK: - Actions
    
    @objc func didLongPressCell(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state != .began { return }
        
        let position = gestureRecognizer.location(in: profileCollectionView)
        
        if let indexPath = profileCollectionView?.indexPathForItem(at: position) {
            print("LongPress:", indexPath.item)
            guard let userPosts = userPosts else { return }
            self.deletedIdx = indexPath.item

            if let postIdx = userPosts[indexPath.item].postIdx {
                //삭제 API 호출
                UserFeedDataManager().deleteUserFeed(self, postIdx)
            }
        }
    }
    
    //MARK: - Helpers
    
    private func setupProfileCollectionview(){
        //delegate
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        //cell register
        profileCollectionView.register(UINib(nibName: "profileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: profileCollectionViewCell.identifier)
        profileCollectionView.register(UINib(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PostCollectionViewCell.postIdentifier)
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(didLongPressCell(gestureRecognizer:)))
        gesture.minimumPressDuration = 0.66
        gesture.delegate = self
        gesture.delaysTouchesBegan = true
        profileCollectionView.addGestureRecognizer(gesture)
    }
    private func setupData() {
        UserFeedDataManager().getUserFeed(self)
    }
}

extension ProfileViewController :UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        default:
            return userPosts?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileCollectionViewCell.identifier, for: indexPath) as? profileCollectionViewCell else {
                fatalError("셀 타입 캐스팅 실패")
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.postIdentifier, for: indexPath) as? PostCollectionViewCell else {
                fatalError("셀 타입 캐스팅 실패")
            }
            
            if let cellData = self.userPosts {
                // 데이터가 있는 경우 cell에 데이터 전달
                cell.setupData(cellData[indexPath.item].postImgUrl)
            }
            return cell
            
        }
        
    }
}

extension ProfileViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height: CGFloat(155))
        } else {
            let size = CGFloat((collectionView.frame.width/3) - (4/3))
            return CGSize(width: size, height: size)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat(0)
        } else {
            return CGFloat(1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat(0)
        } else {
            return CGFloat(1)
        }
    }
}


//MARK: - API
extension ProfileViewController {
    func succesFeedAPI(_ result: UserFeedModel){
        self.userPosts = result.result?.getUserPosts
    }
    func successDeletePostAPI(_ isSuccess: Bool) {
        guard isSuccess else { return }
        if let deletedIdx = self.deletedIdx {
            self.userPosts?.remove(at: deletedIdx)
        }
    }
}
