//
//  ImageExtension.swift
//  mobile-banking-training
//
//  Created by Sao Sophea on 20/12/22.
//

import UIKit

extension UIImage {
    static func gradientImageWithBounds(bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func resize(_ max_size: CGFloat) -> UIImage {
            // adjust for device pixel density
            let max_size_pixels = max_size / UIScreen.main.scale
            // work out aspect ratio
            let aspectRatio =  size.width/size.height
            // variables for storing calculated data
            var width: CGFloat
            var height: CGFloat
            var newImage: UIImage
            if aspectRatio > 1 {
                // landscape
                width = max_size_pixels
                height = max_size_pixels / aspectRatio
            } else {
                // portrait
                height = max_size_pixels
                width = max_size_pixels * aspectRatio
            }
            // create an image renderer of the correct size
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: width, height: height), format: UIGraphicsImageRendererFormat.default())
            // render the image
            newImage = renderer.image {
                (context) in
                self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            }
            // return the image
            return newImage
        }
}

extension UIImageView {

    func setRounded() {
        self.layer.cornerRadius = (self.frame.size.width / 2)
        self.layer.masksToBounds = true
    }
}
