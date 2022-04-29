//
//  StoryCollectionViewCell.swift
//  clonestagram
//
//  Created by 이규빈 on 2022/04/29.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewAllBorder: UIView!
    @IBOutlet weak var viewBorder: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgProfile.layer.cornerRadius = 25
        imgProfile.clipsToBounds = true
        viewBorder.layer.cornerRadius = 25
        viewBorder.clipsToBounds = true
        viewAllBorder.layer.cornerRadius = 25
        viewAllBorder.clipsToBounds = true

    }

}
