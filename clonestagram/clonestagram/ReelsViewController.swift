//
//  ReelsViewController.swift
//  clonestagram
//
//  Created by 이규빈 on 2022/05/21.
//

import UIKit

class ReelsViewController: UIViewController  {
    //MARK: - Properties
    @IBOutlet weak var reelsCollectionView: UICollectionView!
    
    private let videoURLStrArr = ["5049","6379"]
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupReelsCollectionView()
        
    }
    
    //MARK: - Actions
    
    
    //MARK: - Helpers
    private func setupReelsCollectionView(){
        reelsCollectionView.delegate = self
        reelsCollectionView.dataSource = self
        reelsCollectionView.register(UINib(nibName: "ReelsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ReelsCollectionViewCell.identifier)
    }

    

}
//MARK: - Extension
extension ReelsViewController : UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCollectionViewCell.identifier, for: indexPath) as? ReelsCollectionViewCell else {fatalError()}
        return cell
    }
}
extension ReelsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: reelsCollectionView.frame.width, height: reelsCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
}
