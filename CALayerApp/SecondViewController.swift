//
//  SecondViewController.swift
//  CALayerApp
//
//  Created by Felix Titov on 6/15/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import UIKit

class SecondViewController: UIViewController {
    
    // TODO: Animation before the image circle
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 1, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
//            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            
            gradientLayer.locations = [0.2, 0.5, 0.8]
            
            gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.systemRed.cgColor, UIColor.systemGreen.cgColor]
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = CGRect(x: 0, y: self.view.bounds.size.height * 0.2, width: self.view.bounds.size.width, height: self.view.bounds.size.height * 0.6)
    }
    
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.size.height / 2
            imageView.layer.masksToBounds = true
            let borderColor = UIColor.white
            imageView.layer.borderColor = borderColor.cgColor
            imageView.layer.borderWidth = 10
        }
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            button.layer.shadowOpacity = 0.5
            button.layer.shadowRadius = 5
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        gradientLayer = CAGradientLayer()
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
       // view.backgroundColor = .red
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
