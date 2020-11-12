//
//  UIViewExt.swift
//  BaseAFAPI
//
//  Created by ManhLD on 11/12/20.
//

import Foundation
import UIKit

extension UIView {
    func constraintToAllSides(of container: UIView, leftOffset: CGFloat = 0, rightOffset: CGFloat = 0, topOffset: CGFloat = 0, bottomOffset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: container.topAnchor, constant: topOffset),
            leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: leftOffset),
            trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: rightOffset),
            bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: bottomOffset)
            ])
    }
    
    func rounder() {
        let maskPath1 = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft , .topRight], cornerRadii: CGSize(width: 10, height: 10))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    func roundCorners(topLeft: CGFloat = 0, topRight: CGFloat = 0, bottomLeft: CGFloat = 0, bottomRight: CGFloat = 0, borderColor: UIColor = UIColor.clear, borderWidth: CGFloat = 0 ) {
        self.layoutIfNeeded()
        let maskPath = UIBezierPath()
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
        let borderLayer = CAShapeLayer()
        borderLayer.path = (self.layer.mask! as! CAShapeLayer).path! // Reuse the Bezier path
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.lineWidth = borderWidth
        borderLayer.frame = self.bounds
        self.layer.addSublayer(borderLayer)
    }
    
    func addShadow(color: UIColor, opacity: Float, offSet: CGSize, radius: CGFloat) {
        clipsToBounds = false
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        //        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}
