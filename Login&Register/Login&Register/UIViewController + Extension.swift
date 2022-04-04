//
//  UIViewController + Extension.swift
//  Login&Register
//
//  Created by 이규빈 on 2022/04/03.
//

import UIKit

extension UIViewController {
    func generateButtonAttribute(_ button: UIButton,
                                 texts: String...,
                                 fonts: UIFont...,
                                 colors: UIColor...) -> NSMutableAttributedString {
        //text 가져오기
        guard let wholeText = button.titleLabel?.text else {fatalError("버튼에 텍스트가 없음")}
        
        //font
        let customFonts: [UIFont] = fonts
        //STRING RANGE
        let customTextRanges = texts.indices.map { index in
            (wholeText as NSString).range(of: texts[index])
        }
        //color
        let customColors = colors
        //attribute object
        let attributeString = NSMutableAttributedString(string: wholeText)
        
        //setting
        texts.indices.forEach{ index in
            attributeString.addAttribute(.font,
                                         value: customFonts[index],
                                         range: customTextRanges[index])
            attributeString.addAttribute(.foregroundColor,
                                         value: customColors[index],
                                         range: customTextRanges[index])
        }
        return attributeString
    }
}
