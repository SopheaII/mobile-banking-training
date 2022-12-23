//
//  File.swift
//  mobile-banking-training
//
//  Created by Sao Sophea on 20/12/22.
//

import UIKit

extension UIStackView {
    static func customStackView(_ orientation: NSLayoutConstraint.Axis, spacing: CGFloat? = 0, distribution: UIStackView.Distribution? = UIStackView.Distribution.fill, backgroundColor: UIColor? = nil, subviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.axis = orientation
        if let distribution = distribution {
            stackView.distribution = distribution
        }
        
        if let backgroundColor = backgroundColor {
            stackView.backgroundColor = backgroundColor
        }
        if let spacing = spacing {
            stackView.spacing = spacing
        }
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}

