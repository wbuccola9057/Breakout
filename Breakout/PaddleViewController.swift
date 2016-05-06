//
//  PaddleViewController.swift
//  Breakout
//
//  Created by student1 on 5/3/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class PaddleViewController: UIViewController {
    
    
    @IBOutlet weak var paddleView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
            //let paddle = UIView(frame: CGRect(x: 300, y: 900, width: 180, height: 15))
           // paddle.backgroundColor = UIColor.blueColor()
           // view.addSubview(paddle)

        //func handleTap(sender: UIGestureRecognizer) {
        //    let point = sender.locationInView(view)
        //    paddle.center = CGPointMake(point.x, point.y)
      //  print("Tapped")
        //}
        
        
        
        
        //ball
        var imageView : UIImageView
        imageView  = UIImageView(frame: CGRect(x: 385, y: 875, width: 25, height: 25))
        imageView.image = UIImage(named:"ball")
        self.view.addSubview(imageView)
    
        
        let block1 = UIView(frame: CGRect(x: 50, y: 100, width: 100, height: 50))
        block1.backgroundColor = UIColor.redColor()
        view.addSubview(block1)

    
    }
    
    @IBAction func myPauseButton(sender: UIButton) {
    }
   
    @IBAction func paddleMovement(sender: AnyObject) {
       

    }
}
