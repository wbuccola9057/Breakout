//
//  PaddleViewController.swift
//  Breakout
//
//  Created by student1 on 5/3/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class PaddleViewController: UIViewController, UICollisionBehaviorDelegate {
    
    var dynamicAnimator = UIDynamicAnimator()
    
    let paddle = UIView(frame: CGRect(x: 300, y: 900, width: 180, height: 15))

    override func viewDidLoad() {
        super.viewDidLoad()
        paddle.backgroundColor = UIColor.blueColor()
        view.addSubview(paddle)
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        
        setupViews()
        
        
        //this is what i am trying to use to make the paddle move
        
        func handleMove(sender: UIGestureRecognizer) {
            let point = sender.locationInView(view)
            paddle.center = CGPointMake(point.x, point.y)
            
            print("Moved")
        }
        
        
        
        
        //ball
        
    
        
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
    
    func setupViews() {
        
        let imageView : UIImageView
        imageView  = UIImageView(frame: CGRect(x: 385, y: 875, width: 25, height: 25))
        imageView.image = UIImage(named:"ball")
        self.view.addSubview(imageView)
        
        addDynamicBehavior([imageView])
        
    }
    
    func addDynamicBehavior(array: [UIImageView]) {
        let dynamicItemBehavior = UIDynamicItemBehavior(items: array)
        dynamicItemBehavior.density = 1.0
        dynamicItemBehavior.friction = 0.0
        dynamicItemBehavior.resistance = 0.0
        dynamicItemBehavior.elasticity = 1.0
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
        let pushBehavior = UIPushBehavior(items: array, mode: .Instantaneous)
        pushBehavior.magnitude = 1.0
        pushBehavior.pushDirection = CGVectorMake(0.5, 0.5)
        dynamicAnimator.addBehavior(pushBehavior)
        
        let collisionBehavior = UICollisionBehavior(items: array)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .Everything
        collisionBehavior.collisionDelegate = self
        dynamicAnimator.addBehavior(collisionBehavior)
        
    }
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {
        
    
    }

    
    
    @IBAction func myPauseButton(sender: UIButton) {
        let alert = UIAlertController(title: "Game Paused", message: "Tap 'Resume' To Resume", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "Resume", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
   
    @IBAction func paddleMovement(sender: UIPanGestureRecognizer) {
        let point = sender.locationInView(paddle)
        paddle.center = CGPointMake(point.x, point.y)
    }
       

}













