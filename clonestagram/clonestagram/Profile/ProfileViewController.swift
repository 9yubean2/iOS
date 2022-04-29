//
//  ProfileViewController.swift
//  clonestagram
//
//  Created by 이규빈 on 2022/04/30.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileCollectionview()
    }
    //MARK: - Actions
    
    //MARK: - Helpers
    
    private func setupProfileCollectionview(){
        //delegate
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        //cell register
        profileCollectionView.register(UINib(nibName: "profileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: profileCollectionViewCell.identifier)
        profileCollectionView.register(UINib(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PostCollectionViewCell.postIdentifier)
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
            return 24
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
            return cell
            
        }
        
    }
}

extension ProfileViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height: CGFloat(159))
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
