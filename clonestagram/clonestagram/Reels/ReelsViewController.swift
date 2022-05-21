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
    
    private let videoURLStrArr = ["5049","6378"]
    private var nowPage = 0
    
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
        reelsCollectionView.decelerationRate = .fast
        reelsCollectionView.register(ReelsCell.self, forCellWithReuseIdentifier: ReelsCell.identifier)
        
        startLoop()
    }

    private func startLoop() {
        let _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            self.moveNextPage()
            
        }
    }
    private func moveNextPage() {
        let itemCount = reelsCollectionView.numberOfItems(inSection: 0)
        nowPage += 1
        if (nowPage >= itemCount) {
            nowPage = 0
        }
        reelsCollectionView.scrollToItem(at: IndexPath(item: nowPage, section: 0), at: .centeredVertically, animated: true)
    }
    

}
//MARK: - Extension
extension ReelsViewController : UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCell.identifier, for: indexPath) as? ReelsCell else {return UICollectionViewCell()}
        cell.setupURL(videoURLStrArr.randomElement()!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ReelsCell {
            cell.videoView?.cleanup()
        }
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
