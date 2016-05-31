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
    
    var theBall = UIImageView()
    
    var block1 = UIView()
    var block2 = UIView()
    var block3 = UIView()
    var block4 = UIView()
    var block5 = UIView()

    
    //1
    var pushBehavior = UIPushBehavior()
    var dynamicItemBehavior = UIDynamicItemBehavior()
    var collisionBehavior = UICollisionBehavior()
    var paddleBehavior = UIDynamicItemBehavior()

    
    //2
    var pushBehavior2 = UIPushBehavior()
    var dynamicItemBehavior2 = UIDynamicItemBehavior()
    var collisionBehavior2 = UICollisionBehavior()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paddle.backgroundColor = UIColor.blueColor()
        view.addSubview(paddle)
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
        
    }
    
    
    

    func setupImageView() {
        
        
        theBall  = UIImageView(frame: CGRect(x: 385, y: 875, width: 25, height: 25))
        theBall.image = UIImage(named:"ball")
        self.view.addSubview(theBall)
        addDynamicBehavior([theBall])
        
        
    }
    
    
    //1 (use this one)
    func addDynamicBehavior(array : [UIImageView]) {
        dynamicItemBehavior = UIDynamicItemBehavior(items: array)
        dynamicItemBehavior.density = 2.0
        dynamicItemBehavior.friction = 0.0
        dynamicItemBehavior.resistance = 0.0
        dynamicItemBehavior.elasticity = 1.0
        dynamicItemBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
        paddleBehavior = UIDynamicItemBehavior(items: [paddle])
        paddleBehavior.density = 100000.0
        paddleBehavior.friction = 0.0
        paddleBehavior.resistance = 0.0
        paddleBehavior.elasticity = 0.5
        dynamicAnimator.addBehavior(paddleBehavior)
        
        pushBehavior = UIPushBehavior(items: array, mode: .Instantaneous)
        pushBehavior.magnitude = 1.0
        pushBehavior.pushDirection = CGVectorMake(-0.5, -0.5)
        dynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior(items: [theBall, paddle])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .Everything
        collisionBehavior.collisionDelegate = self
        

        dynamicAnimator.addBehavior(collisionBehavior)
        
        
    }
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {}

    //2 (dont use this one)
    func addDynamicBehavior2(array : [UIImageView]) {
        dynamicItemBehavior2 = UIDynamicItemBehavior(items: array)
        dynamicItemBehavior2.density = 0.0
        dynamicItemBehavior2.friction = 0.0
        dynamicItemBehavior2.resistance = 0.0
        dynamicItemBehavior2.elasticity = 0.0
        
        pushBehavior = UIPushBehavior(items: array, mode: .Continuous)
        pushBehavior.magnitude = 50.0
        pushBehavior.pushDirection = CGVectorMake(-0.5, -0.5)
        
        collisionBehavior2 = UICollisionBehavior(items: [paddle, theBall])
        collisionBehavior2.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior2.collisionMode = .Everything
        collisionBehavior2.collisionDelegate = self
    }
    func collisionBehavior2(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {}
    
    
    
    //pause game
    @IBAction func myPauseButton(sender: UIButton) {
        dynamicAnimator.removeBehavior(pushBehavior)
        dynamicAnimator.removeBehavior(collisionBehavior)
        dynamicAnimator.removeBehavior(dynamicItemBehavior)
    }
   
    
    //paddle
    @IBAction func paddleMovement(sender: UIPanGestureRecognizer) {
        let point = sender.locationInView(self.view)
        print(point)
        paddle.center = CGPointMake(point.x, paddle.center.y)
    }
    
    
    //resume game
    @IBAction func resumeGame(sender: UIButton) {
        dynamicAnimator.addBehavior(pushBehavior)
        dynamicAnimator.addBehavior(collisionBehavior)
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        //dynamicAnimator.addBehavior(dynamicItemBehavior2)
        //dynamicAnimator.addBehavior(pushBehavior2)
        //dynamicAnimator.addBehavior(collisionBehavior2)

    }

}













