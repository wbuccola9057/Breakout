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

    var theBall = UIImageView()
    
    var block1 = UIView()
    var block2 = UIView()
    var block3 = UIView()
    var block4 = UIView()
    var block5 = UIView()
    var paddle = UIView()
    
    var counter = 0
    
    var pushBehavior = UIPushBehavior()
    var dynamicItemBehavior = UIDynamicItemBehavior()
    var collisionBehavior = UICollisionBehavior()
    var paddleCollisionBehavior = UICollisionBehavior()
    var paddleDynamicBehavior = UIDynamicItemBehavior()
    var block1Behavior = UIDynamicItemBehavior()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dynamicAnimator = UIDynamicAnimator(referenceView: view)

        setupViews()
        setupImageView()
        
    }
    
    func setupViews() {
        
        block1 = UIView(frame: CGRect(x: 5, y: 100, width: 150, height: 25))
        block2 = UIView(frame: CGRect(x: 160, y: 100, width: 150, height: 25))
        block3 = UIView(frame: CGRect(x: 315, y: 100, width: 150, height: 25))
        block4 = UIView(frame: CGRect(x: 470, y: 100, width: 150, height: 25))
        block5 = UIView(frame: CGRect(x: 625, y: 100, width: 140, height: 25))
        
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
        
        paddle = UIView(frame: CGRect(x: 300, y: 900, width: 180, height: 15))
        paddle.backgroundColor = UIColor.blueColor()
        view.addSubview(paddle)
    }

    func setupImageView() {
        
        theBall  = UIImageView(frame: CGRect(x: 385, y: 875, width: 25, height: 25))
        theBall.image = UIImage(named:"ball")
        self.view.addSubview(theBall)
        addDynamicBehavior([theBall])
        
    }
    
    func addDynamicBehavior(array : [UIImageView]) {
        dynamicItemBehavior = UIDynamicItemBehavior(items: array)
        dynamicItemBehavior.density = 1.0
        dynamicItemBehavior.friction = 0.0
        dynamicItemBehavior.resistance = 0.0
        dynamicItemBehavior.elasticity = 1
        dynamicItemBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
        paddleDynamicBehavior = UIDynamicItemBehavior(items: [paddle])
        paddleDynamicBehavior.density = 1000000.0
        paddleDynamicBehavior.friction = 0.0
        paddleDynamicBehavior.resistance = 0.0
        paddleDynamicBehavior.elasticity = 0.0
        paddleDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(paddleDynamicBehavior)
        
        block1Behavior = UIDynamicItemBehavior(items: [block1,block2,block3,block4,block5])
        block1Behavior.density = 1000000.0
        block1Behavior.friction = 0.0
        block1Behavior.resistance = 0.0
        block1Behavior.elasticity = 0.0
        block1Behavior.allowsRotation = false
        dynamicAnimator.addBehavior(block1Behavior)
        
        pushBehavior = UIPushBehavior(items: array, mode: .Instantaneous)
        pushBehavior.magnitude = -1.0
        pushBehavior.pushDirection = CGVectorMake(-0.5, -0.5)
        dynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior(items: array)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .Everything
        collisionBehavior.collisionDelegate = self
        
        collisionBehavior.addItem(block1)
        collisionBehavior.addItem(block2)
        collisionBehavior.addItem(block3)
        collisionBehavior.addItem(block4)
        collisionBehavior.addItem(block5)
        dynamicAnimator.addBehavior(collisionBehavior)
        
        paddleCollisionBehavior = UICollisionBehavior(items: [paddle, theBall])
        paddleCollisionBehavior.translatesReferenceBoundsIntoBoundary = true
        paddleCollisionBehavior.collisionMode = .Everything
        paddleCollisionBehavior.collisionDelegate = self
        

        
        dynamicAnimator.addBehavior(paddleCollisionBehavior)
        
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem, atPoint p: CGPoint)
    {
        if item2.isEqual(block1)
        {
            block1.removeFromSuperview()
            collisionBehavior.removeItem(block1)
        }
        if item2.isEqual(block2)
        {
            block2.removeFromSuperview()
            collisionBehavior.removeItem(block2)
        }
        if item2.isEqual(block3)
        {
            block3.removeFromSuperview()
            collisionBehavior.removeItem(block3)
        }
        if item2.isEqual(block4)
        {
            block4.removeFromSuperview()
            collisionBehavior.removeItem(block4)
        }
        if item2.isEqual(block5)
        {
            block5.removeFromSuperview()
            collisionBehavior.removeItem(block5)
        }
    }

    //2 (dont use this one)
        func collisionBehavior2(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint)
    {
    
    }
   
    @IBAction func resetButton(sender: AnyObject) {
        paddle.removeFromSuperview()
        block1.removeFromSuperview()
        block2.removeFromSuperview()
        block3.removeFromSuperview()
        block4.removeFromSuperview()
        block5.removeFromSuperview()
        theBall.removeFromSuperview()
        
        
        setupViews()
        view.addSubview(theBall)
    }
    
    //paddle
    @IBAction func paddleMovement(sender: UIPanGestureRecognizer) {
        let point = sender.locationInView(self.view)
        paddle.center = CGPointMake(point.x, paddle.center.y)
        dynamicAnimator.updateItemUsingCurrentState(paddle)
        dynamicAnimator.updateItemUsingCurrentState(theBall)

        if theBall.center.y >= paddle.center.y {
            
            theBall.removeFromSuperview()
            paddle.removeFromSuperview()
            block1.removeFromSuperview()
            block2.removeFromSuperview()
            block3.removeFromSuperview()
            block4.removeFromSuperview()
            block5.removeFromSuperview()

            
            let alert = UIAlertController(title: "Alert", message: "Game Over", preferredStyle: UIAlertControllerStyle.Alert)
            dynamicAnimator.removeBehavior(dynamicItemBehavior)
            dynamicAnimator.removeBehavior(collisionBehavior)
            dynamicAnimator.removeBehavior(pushBehavior)
            

            alert.addAction(UIAlertAction(title: "Restart", style: UIAlertActionStyle.Default, handler: nil))
            dynamicAnimator.addBehavior(dynamicItemBehavior)
            dynamicAnimator.addBehavior(collisionBehavior)
            dynamicAnimator.addBehavior(pushBehavior)
            
            setupViews()
            setupImageView()
            view.addSubview(theBall)
            
            self.presentViewController(alert, animated: true, completion: nil)
            
            
        }
    }
}