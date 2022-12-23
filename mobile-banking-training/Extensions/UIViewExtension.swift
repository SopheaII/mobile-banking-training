//
//  UIViewExtension.swift
//  mobile-banking-training
//
//  Created by Sao Sophea on 20/12/22.
//

import UIKit

extension UIView {
    
    static func spacer(size: CGFloat = 50, for layout: NSLayoutConstraint.Axis = .horizontal) -> UIView {
        let spacer = UIView()
        if layout == .horizontal {
            spacer.widthAnchor.constraint(equalToConstant: size).isActive = true
        } else {
            spacer.heightAnchor.constraint(equalToConstant: size).isActive = true
        }
        
        return spacer
    }
    
    static func customIcon(size: CGFloat = 0, iconSize: CGFloat, iconName: String, color: String? = "", bgColor: String) -> UIView {
        let iconContainer = UIView(frame: CGRect(x:0 , y:0, width: size, height: size))
        let imageView = UIImageView(image: UIImage(named: iconName)?.resize(iconSize))
        if let color = color {
            imageView.tintColor = UIColor(named: color)
        }
        imageView.center = iconContainer.center
        
        NSLayoutConstraint.activate([
            iconContainer.widthAnchor.constraint(equalToConstant: size),
            iconContainer.heightAnchor.constraint(equalToConstant: size),
        ])
        iconContainer.backgroundColor = UIColor(named: bgColor)
        iconContainer.layer.cornerRadius = size / 2
        iconContainer.addSubview(imageView)
        
        return iconContainer
    }
    
    static func divider (thickness: CGFloat, axis:  NSLayoutConstraint.Axis, color: UIColor?) -> UIView{
        let line = UIView()
        if let color = color { line.backgroundColor = color}
        
        switch axis {
        case .horizontal:
            NSLayoutConstraint.activate([
                line.heightAnchor.constraint(equalToConstant: thickness),
            ])
        case .vertical:
            NSLayoutConstraint.activate([
                line.widthAnchor.constraint(equalToConstant: thickness),
            ])
        default:
            break
        }
        
        return line
    }
    
}
