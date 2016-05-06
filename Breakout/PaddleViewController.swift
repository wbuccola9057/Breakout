//
//  PaddleViewController.swift
//  Breakout
//
//  Created by student1 on 5/3/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class PaddleViewController: UIViewController {
    
    let paddle = UIView(frame: CGRect(x: 300, y: 900, width: 180, height: 15))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paddle.backgroundColor = UIColor.blueColor()
        view.addSubview(paddle)

        let tapGesture = UIPanGestureRecognizer(target: self, action: Selector("onCustonPan"))
        //let tapGesture = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        paddle.addGestureRecognizer(tapGesture)
        
        func handleTap(sender: UIGestureRecognizer) {
        let point = sender.locationInView(self.view)
        paddle.center = point
        
        
        print("Tapped")
    }
        
        var imageView : UIImageView
        imageView  = UIImageView(frame: CGRect(x: 385, y: 875, width: 25, height: 25))
        imageView.image = UIImage(named:"ball")
        self.view.addSubview(imageView)
    

    
    }
    
    @IBAction func myPauseButton(sender: UIButton) {
    }
   
    @IBAction func paddleMovement(sender: AnyObject) {
    }
}
