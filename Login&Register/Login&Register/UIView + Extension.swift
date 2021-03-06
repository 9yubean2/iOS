//
//  UIView + Extension.swift
//  Login&Register
//
//  Created by 이규빈 on 2022/04/03.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
