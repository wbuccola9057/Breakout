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
        
        let block1 = UIView(frame: CGRect(x: 5, y: 100, width: 150, height: 25))
        block1.backgroundColor = UIColor.redColor()
        view.addSubview(block1)
        
        let block2 = UIView(frame: CGRect(x: 160, y: 100, width: 150, height: 25))
        block2.backgroundColor = UIColor.redColor()
        view.addSubview(block2)
        
        let block3 = UIView(frame: CGRect(x: 315, y: 100, width: 150, height: 25))
        block3.backgroundColor = UIColor.redColor()
        view.addSubview(block3)
        
        let block4 = UIView(frame: CGRect(x: 470, y: 100, width: 150, height: 25))
        block4.backgroundColor = UIColor.redColor()
        view.addSubview(block4)
        
        let block5 = UIView(frame: CGRect(x: 625, y: 100, width: 140, height: 25))
        block5.backgroundColor = UIColor.redColor()
        view.addSubview(block5)

        
    }
    
    @IBAction func myPauseButton(sender: UIButton) {
    }
   
    @IBAction func paddleMovement(sender: AnyObject) {
    }
}
