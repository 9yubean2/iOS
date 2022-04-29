//
//  FeedTableViewCell.swift
//  clonestagram
//
//  Created by 이규빈 on 2022/04/29.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

//    @IBOutlet weak var buttonBookmark: UIButton!

//    @IBOutlet weak var imageViewMyProfile: UIImageView!
//    @IBOutlet weak var labelUserName: UILabel!
//    @IBOutlet weak var imageViewUserProfile: UIImageView!
//    @IBOutlet weak var labelFeed: UILabel!
    
    @IBOutlet weak var img_UserProfile: UIImageView!
    @IBOutlet weak var img_MyProfile: UIImageView!
    @IBOutlet weak var btnHeart: UIButton!
    
    @IBOutlet weak var btnBookmark: UIButton!
    
    @IBAction func btnHeartisTapped(_ sender: Any) {
        if btnHeart.isSelected{
            btnHeart.isSelected = false
        } else {
            btnHeart.isSelected = true
        }
    }

    @IBAction func btnBookmarkisTapped(_ sender: Any) {
        if btnBookmark.isSelected{
            btnBookmark.isSelected = false
        } else {
            btnBookmark.isSelected = true
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img_UserProfile.layer.cornerRadius = 14.5
        img_UserProfile.clipsToBounds = true
        img_MyProfile.layer.cornerRadius = 14.5
        img_MyProfile.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
