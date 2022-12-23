//
//  UILabelExtension.swift
//  mobile-banking-training
//
//  Created by Sao Sophea on 22/12/22.
//

import UIKit

extension UILabel {
    
    static func customLabel(fontSize: CGFloat?, textColor: UIColor?, text: String, textAlign: NSTextAlignment?) -> UILabel {
        let label = UILabel()
        if let fontSize = fontSize { label.font = label.font.withSize(fontSize) }
        if let textColor = textColor { label.textColor = textColor}
        label.text = text
        if let textAlign = textAlign { label.textAlignment = textAlign}
        
        return label
    }
    
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: textString.count))
            self.attributedText = attributedString
        }
    }
}
