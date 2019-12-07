//
//  ViewController.swift
//  Animation
//
//  Created by Sergey Popyvanov on 07.12.2019.
//  Copyright © 2019 Sergey Popyvanov. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
  
    //Car Single tap Outlet
    @IBOutlet weak var carView: UIView!
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var carLabel: UILabel!
    
    //Rectangle pan right
    @IBOutlet weak var rectangleView: UIView!
    @IBOutlet weak var rectangleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var rectangleImage: UIImageView!
    @IBOutlet weak var rectangleLabel: UILabel!
    
    var panGestureAnchorPoint: CGPoint?
    
    //steering wheel Animation outlets
    
    @IBOutlet weak var wheelView: UIView!
    @IBOutlet weak var wheelImage: UIImageView!
    @IBOutlet weak var rotateLabel: UILabel!
    
    var rotateGestureAnchorRotation: CGFloat?
    var scale: CGFloat = 1.0 { didSet { updateWheelImageTransform() } }
    var rotation: CGFloat = 0.0 { didSet { updateWheelImageTransform() } }
    
    // pinch View outlets
    @IBOutlet weak var pinchView: UIView!
    @IBOutlet weak var pinchImage: UIImageView!
    @IBOutlet weak var pinchLabel: UILabel!
    
    var pinchGestureAnchorScale: CGFloat?
    var scale1: CGFloat = 1.0 { didSet { updatePinchImageTransform() } }
    var rotation1: CGFloat = 0.0 { didSet { updatePinchImageTransform() } }
    
    // double touch
    
    @IBOutlet weak var doubleTouchView: UIView!
    @IBOutlet weak var doubleTouch: UIButton!
    
    //long press
    
    @IBOutlet weak var longPressView: UIView!
    @IBOutlet weak var bombImage: UIImageView!
    @IBOutlet weak var longPressLabel: UILabel!
  
    var scale2: CGFloat = 1.0 { didSet { updateBombImageTransform() } }
    var rotation2: CGFloat = 0.0 { didSet { updateBombImageTransform() } }
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for Car Single tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(oneTap))
        tap.numberOfTouchesRequired = 1
        carView.addGestureRecognizer(tap)

       // for rectangle Pan Right
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panRight(_:)))
        panGestureRecognizer.maximumNumberOfTouches = 1
        rectangleView.addGestureRecognizer(panGestureRecognizer)
       
        // for rotate steering wheel
        let rotateGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(rotateWheel(_:)))
        wheelView.addGestureRecognizer(rotateGestureRecognizer)
        
        // pinch
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        pinchView.addGestureRecognizer(pinch)
        
        // double touch
        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTouch(_:)))
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        doubleTouchView.addGestureRecognizer(doubleTapGestureRecognizer)
        
        // long press
        let longPressTapGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPressView.addGestureRecognizer(longPressTapGestureRecognizer)
    
    }
    
    @objc func oneTap() {
        animateCarRight()
        carLabel.isHidden = true
    }
    
    
    func animateCarRight(){
        UIView.animate(withDuration: 3.0, delay: 0.0, options: [], animations: {self.carLeadingConstraint.constant = 300
            self.view.layoutIfNeeded()
        })
    
    }
    
    @objc func panRight(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        switch gestureRecognizer.state {
        case .began:
            panGestureAnchorPoint = gestureRecognizer.location(in: rectangleView)
        case .changed:
            guard let panGestureAnchorPoint = panGestureAnchorPoint else {return }
            
            let gesturePoint = gestureRecognizer.location(in: rectangleView)
            rectangleLeadingConstraint.constant += gesturePoint.x - panGestureAnchorPoint.x
            self.panGestureAnchorPoint = gesturePoint
            if rectangleLeadingConstraint.constant > 100 {
                rectangleImage.backgroundColor = .green
                rectangleLabel.isHidden = true
            }
            
        case .cancelled:
            panGestureAnchorPoint = nil
            
        case .failed, .possible, .ended:
            break
        @unknown default:
            break
        }
        
    }
    
    func updateWheelImageTransform() {
        wheelImage.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale).rotated(by: rotation)
   
    }
    
     func updatePinchImageTransform() {
         pinchImage.transform = CGAffineTransform.identity.scaledBy(x: scale1, y: scale1).rotated(by: rotation1)
    
     }
    
    func updateBombImageTransform() {
         bombImage.transform = CGAffineTransform.identity.scaledBy(x: scale2, y: scale2).rotated(by: rotation2)
    
     }
        
    @objc private func rotateWheel(_ gestureRecognizer: UIRotationGestureRecognizer) {

        switch gestureRecognizer.state {
        case .began:
         
            rotateGestureAnchorRotation = gestureRecognizer.rotation

        case .changed:
            guard let rotateGestureAnchorRotation = rotateGestureAnchorRotation else { assert(false); return }
            rotateLabel.isHidden = true
            let gestureRotation = gestureRecognizer.rotation
            rotation += gestureRotation - rotateGestureAnchorRotation
            self.rotateGestureAnchorRotation = gestureRotation

        case .cancelled, .ended:
            rotateGestureAnchorRotation = nil

        case .failed, .possible:
            
            break
        @unknown default:
            break
        }
    }

    @objc func handlePinch(_ gestureRecognizer: UIPinchGestureRecognizer) {
    
            switch gestureRecognizer.state {
            case .began:
                pinchGestureAnchorScale = gestureRecognizer.scale

            case .changed:
                guard let pinchGestureAnchorScale = pinchGestureAnchorScale else { assert(false); return }
                pinchLabel.isHidden = true
                let gestureScale = gestureRecognizer.scale
                scale1 += gestureScale - pinchGestureAnchorScale
                self.pinchGestureAnchorScale = gestureScale

            case .cancelled, .ended:
                pinchGestureAnchorScale = nil

            case .failed, .possible:
                break
            @unknown default:
                break
        }
        }
    
    @objc private func handleDoubleTouch(_ gestureRecognizer: UITapGestureRecognizer) {
    
        if doubleTouch.backgroundColor == .green {
            doubleTouch.backgroundColor = .red
            return
        }
        
        doubleTouch.backgroundColor = .green

        
    }
        
    @objc func handleLongPress(_ gestureReconizer: UILongPressGestureRecognizer) {
        
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            UIView.animate(withDuration: 3.0, delay: 0.0, options: [], animations: {self.scale2 = 5
            self.longPressView.layoutIfNeeded()
               })
    
        }
         else {
            UIView.animate(withDuration: 3.0, delay: 0.0, options: [], animations: {self.scale2 = 1
            self.longPressView.layoutIfNeeded()
            self.longPressLabel.isHidden = true
            })
            
         }
     }


    

}

