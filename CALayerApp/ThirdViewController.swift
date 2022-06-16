//
//  ThirdViewController.swift
//  CALayerApp
//
//  Created by Felix Titov on 6/16/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import UIKit

class ThirdViewController: UIViewController {
    
    var replicatorLayer: CAReplicatorLayer!
    var sourceLayer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        replicatorLayer = CAReplicatorLayer()
        sourceLayer = CALayer()
        
        self.view.layer.addSublayer(replicatorLayer)
        
        replicatorLayer.addSublayer(sourceLayer)
        // Do any additional setup after loading the view.
        
        startAnimation(delay: 0.1, replicates: 30)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        replicatorLayer.frame = view.bounds
        replicatorLayer.position = view.center
        
        sourceLayer.frame = CGRect(x: 0.0, y: 0.0, width: 3, height: 17)
        sourceLayer.backgroundColor = UIColor.white.cgColor
        
        sourceLayer.position = view.center
        sourceLayer.anchorPoint = CGPoint(x: 0.0, y: 5.0)
        
        
    }
    
    func startAnimation(delay: TimeInterval, replicates: Int) {
        replicatorLayer.instanceCount = replicates
        
        let angle = CGFloat(2.0 * Double.pi) / CGFloat(replicates)
        
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)
        
        replicatorLayer.instanceDelay = delay
        
        sourceLayer.opacity = 0
        
        let opacityAnim = CABasicAnimation(keyPath: "opacity")
        
        opacityAnim.fromValue = 1
        opacityAnim.toValue = 0
        
        opacityAnim.duration = Double(replicates) * delay
        opacityAnim.repeatCount = Float.infinity
        
        sourceLayer.add(opacityAnim, forKey: nil)
    }
    
    
}
