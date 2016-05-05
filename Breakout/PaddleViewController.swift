//
//  PaddleViewController.swift
//  Breakout
//
//  Created by student1 on 5/3/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class PaddleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let paddle = UIView(frame: CGRect(x: 300, y: 900, width: 180, height: 15))
        paddle.backgroundColor = UIColor.blueColor()
        view.addSubview(paddle)
        
        
        var imageView : UIImageView
        imageView  = UIImageView(frame: CGRect(x: 385, y: 875, width: 25, height: 25))
        imageView.image = UIImage(named:"ball")
        self.view.addSubview(imageView)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(PaddleViewController.handleTap(_:)))
        paddle.addGestureRecognizer(tapGesture)
        
        func handleTap(sender: UIGestureRecognizer) {
        let point = sender.locationInView(self.view)
        paddle.center = point
        
        
        print("Tapped")
    }
    
    

    
    }
    
    @IBAction func myPauseButton(sender: UIButton) {
    }
   
    @IBAction func paddleMovement(sender: AnyObject) {
    }
}
