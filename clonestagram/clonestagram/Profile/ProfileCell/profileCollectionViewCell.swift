//
//  profileCollectionViewCell.swift
//  clonestagram
//
//  Created by 이규빈 on 2022/04/30.
//
import UIKit

class profileCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblFollowing: UILabel!
    @IBOutlet weak var lblFollower: UILabel!
    @IBOutlet weak var lblPosting: UILabel!
    @IBOutlet weak var btnAddFriend: UIButton!
    @IBOutlet weak var btnEditProfile: UIButton!
    @IBOutlet weak var imgProfileImage: UIImageView!
    @IBOutlet weak var imgAddProfile: UIImageView!
    static let identifier = "profileCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
    }

    func setupAttribute() {
        imgProfileImage.layer.cornerRadius = 44
        imgAddProfile.layer.cornerRadius = 12
        
        
        btnAddFriend.layer.borderWidth = 1

        btnAddFriend.layer.borderColor = UIColor.lightGray.cgColor

        btnAddFriend.layer.cornerRadius = 3

        btnEditProfile.layer.borderWidth = 1
        btnEditProfile.layer.borderColor = UIColor.lightGray.cgColor

        btnEditProfile.layer.cornerRadius = 5
        
        [lblPosting,lblFollower, lblFollowing] . forEach{$0.text = "\(Int.random(in: 0...10))"}
    }
}
