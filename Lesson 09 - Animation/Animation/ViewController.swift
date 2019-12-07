//
//  ViewController.swift
//  Animation
//
//  Created by Sergey Popyvanov on 07.12.2019.
//  Copyright © 2019 Sergey Popyvanov. All rights reserved.
//

import UIKit

func handleAnimate(){}

class ViewController: UIViewController {

    

    @IBOutlet weak var carImageView: UIImageView!
    
    @IBOutlet weak var leadinConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateCarRight()
        animateCarRotate()
        
    }
    
    func animateCarRight(){
        UIView.animate(withDuration: 3.0, delay: 3, options: [], animations: {self.leadinConstraint.constant = 300
            self.view.layoutIfNeeded()
        })
    
    }
    
    func animateCarRotate(){

        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Double.pi
        rotationAnimation.duration = 1.0
         
        UIView.animate(withDuration: 1.0, delay: 3.0, animations: {self.carImageView.layer.add(rotationAnimation, forKey: nil)
            self.view.layoutIfNeeded()
        })
        
    
    }
    
    func animateCarLeft(){
        UIView.animate(withDuration: 3.0, animations: {self.leadinConstraint.constant = 0
            self.view.layoutIfNeeded()
        })
    
    }


}

