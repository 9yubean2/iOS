//
//  PostCollectionViewCell.swift
//  clonestagram
//
//  Created by 이규빈 on 2022/04/30.
//
import UIKit
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    static let postIdentifier = "PostCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupData(_ imageURLstr: String?) {
        guard let imageURLstr = imageURLstr else { return }
        if let url = URL(string: imageURLstr){
            postImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        }

    }

}
