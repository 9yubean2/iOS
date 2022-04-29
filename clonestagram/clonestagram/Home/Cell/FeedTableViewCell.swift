//
//  FeedTableViewCell.swift
//  clonestagram
//
//  Created by 이규빈 on 2022/04/29.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonBookmark: UIButton!
    @IBOutlet weak var buttonHeart: UIButton!
    @IBOutlet weak var imageViewMyProfile: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    @IBOutlet weak var labelFeed: UILabel!
    
    
    @IBAction func buttonHeartisTapped(_ sender: Any) {
        if buttonHeart.isSelected{
            buttonHeart.isSelected = false
        } else {
            buttonHeart.isSelected = true
        }
    }
    
    @IBAction func buttonBookmarkisTapped(_ sender: Any) {
        if buttonBookmark.isSelected{
            buttonBookmark.isSelected = false
        } else {
            buttonBookmark.isSelected = true
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //imageViewUserProfile.layer.cornerRadius = 22.5
//        imageViewUserProfile.clipsToBounds = true
//        imageViewMyProfile.layer.cornerRadius = 22.5
//        imageViewMyProfile.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
