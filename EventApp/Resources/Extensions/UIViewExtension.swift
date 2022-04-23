//
//  UIViewExtension.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import Foundation
import UIKit

extension UIView {
    
    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        if #available(iOS 11, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = corners
        } else {
            var cornerMask = UIRectCorner()
            if(corners.contains(.layerMinXMinYCorner)){
                cornerMask.insert(.topLeft)
            }
            if(corners.contains(.layerMaxXMinYCorner)){
                cornerMask.insert(.topRight)
            }
            if(corners.contains(.layerMinXMaxYCorner)){
                cornerMask.insert(.bottomLeft)
            }
            if(corners.contains(.layerMaxXMaxYCorner)){
                cornerMask.insert(.bottomRight)
            }
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: cornerMask, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}

public func shadow(Vw : UIView) {
    Vw.layer.masksToBounds = false
    Vw.layer.shadowColor = hexColor(hex: "#C4C4C4").cgColor
    Vw.layer.shadowOffset = CGSize(width: 0, height: 1)
    Vw.layer.shadowRadius = 5.0
    Vw.layer.shadowOpacity = 10.0
    Vw.layer.cornerRadius = 10.0
}
