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
    
    var pushBehavior = UIPushBehavior()
    var dynamicItemBehavior = UIDynamicItemBehavior()
    var collisionBehavior = UICollisionBehavior()
    var collisionBehavior2 = UICollisionBehavior()
    var pushBehavior2 = UIPushBehavior()
    var dynamicItemBehavior2 = UIDynamicItemBehavior()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paddle.backgroundColor = UIColor.blueColor()
        view.addSubview(paddle)
        dynamicAnimator = UIDynamicAnimator(referenceView: view)

        setupViews()
        setupImageView()
        
    }
    
    func setupViews() {
        let block1 = UIView(frame: CGRect(x: 5, y: 100, width: 150, height: 25))
        let block2 = UIView(frame: CGRect(x: 160, y: 100, width: 150, height: 25))
        let block3 = UIView(frame: CGRect(x: 315, y: 100, width: 150, height: 25))
        let block4 = UIView(frame: CGRect(x: 470, y: 100, width: 150, height: 25))
        let block5 = UIView(frame: CGRect(x: 625, y: 100, width: 140, height: 25))
        
        
        
        block1.backgroundColor = UIColor.redColor()
        view.addSubview(block1)
        
        block2.backgroundColor = UIColor.redColor()
        view.addSubview(block2)
        
        block3.backgroundColor = UIColor.redColor()
        view.addSubview(block3)
        
        block4.backgroundColor = UIColor.redColor()
        view.addSubview(block4)
        
        block5.backgroundColor = UIColor.redColor()
        view.addSubview(block5)
        
        

    }
    func setupImageView2() {
        
        let imageView : UIImageView
        imageView  = UIImageView(frame: CGRect(x: 385, y: 875, width: 25, height: 25))
        imageView.image = UIImage(named:"ball")
        self.view.addSubview(imageView)
        
        addDynamicBehavior([imageView])
        
    }
    
    func addDynamicBehavior2(array : [UIImageView]) {
        dynamicItemBehavior2 = UIDynamicItemBehavior(items: array)
        dynamicItemBehavior2.density = 80.0
        dynamicItemBehavior2.friction = 10.0
        dynamicItemBehavior2.resistance = 0.0
        dynamicItemBehavior2.elasticity = 1.0
        
        pushBehavior2 = UIPushBehavior(items: array, mode: .Instantaneous)
        pushBehavior2.magnitude = 0.5
        pushBehavior2.pushDirection = CGVectorMake(0.5, 0.5)
        
        collisionBehavior2 = UICollisionBehavior(items: array)
        collisionBehavior2.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior2.collisionMode = .Everything
        collisionBehavior2.collisionDelegate = self
        
    }
    
    func setupImageView() {
        
        let imageView : UIImageView
        imageView  = UIImageView(frame: CGRect(x: 385, y: 875, width: 25, height: 25))
        imageView.image = UIImage(named:"ball")
        self.view.addSubview(imageView)
        
        addDynamicBehavior([imageView])
        
    }
    
    func addDynamicBehavior(array : [UIImageView]) {
        dynamicItemBehavior = UIDynamicItemBehavior(items: array)
        dynamicItemBehavior.density = 2.0
        dynamicItemBehavior.friction = 0.0
        dynamicItemBehavior.resistance = 0.0
        dynamicItemBehavior.elasticity = 1.0
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
        pushBehavior = UIPushBehavior(items: array, mode: .Instantaneous)
        pushBehavior.magnitude = 0
        pushBehavior.pushDirection = CGVectorMake(-0.5, -0.5)
        dynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior(items: array)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .Everything
        collisionBehavior.collisionDelegate = self
        dynamicAnimator.addBehavior(collisionBehavior)
        
    }
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {
        
    }
    
    
    @IBAction func myPauseButton(sender: UIButton) {
        let alert = UIAlertController(title: "Game Paused", message: "Tap 'Resume' To Resume", preferredStyle: .Alert)
        dynamicAnimator.addBehavior(pushBehavior2)
        dynamicAnimator.addBehavior(dynamicItemBehavior2)
        dynamicAnimator.addBehavior(collisionBehavior2)
        
        let defaultAction = UIAlertAction(title: "Resume", style: .Default, handler: nil)
        dynamicAnimator.removeBehavior(pushBehavior)
        dynamicAnimator.removeBehavior(collisionBehavior)
        dynamicAnimator.removeBehavior(dynamicItemBehavior)
        
        
        alert.addAction(defaultAction)
        

        presentViewController(alert, animated: true, completion: nil)
    }
   
    
    
    @IBAction func paddleMovement(sender: UIPanGestureRecognizer) {
        let point = sender.locationInView(self.view)
        print(point)
        paddle.center = CGPointMake(point.x, paddle.center.y)
        
        
        
    }
    @IBAction func resumeGame(sender: UIButton) {
        let alert2 = UIAlertController(title: "Game Paused", message: "Tap 'Resume' To Resume", preferredStyle: .Alert)
        dynamicAnimator.removeBehavior(pushBehavior2)
        dynamicAnimator.removeBehavior(collisionBehavior2)
        dynamicAnimator.removeBehavior(dynamicItemBehavior2)

        let defaultAction2 = UIAlertAction(title: "Resume", style: .Default, handler: nil)

        alert2.addAction(defaultAction2)
    }

}













