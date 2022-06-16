//
//  View.swift
//  CALayerApp
//
//  Created by Felix Titov on 6/16/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import UIKit

@IBDesignable
class View: UIView {
    
    private var size = CGSize()
    @IBInspectable var cornerRadiusSize: CGFloat = 0 {
        didSet {
            size = CGSize(width: cornerRadiusSize, height: cornerRadiusSize)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: size).cgPath
        
        layer.mask = shapeLayer
        
    }
    
    override func prepareForInterfaceBuilder() {
        setNeedsLayout()
    }
    

}
