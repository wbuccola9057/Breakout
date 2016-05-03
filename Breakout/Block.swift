//
//  Block.swift
//  Breakout
//
//  Created by student1 on 5/3/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class Block
{
    var paddle: UIView
    var ball: UIView
    var block1: UIView
    var block2: UIView
    var block3: UIView
    var block4: UIView
    var block5: UIView
    
    init(Paddle p: UIView, Ball b: UIView, Block1 b1: UIView, Block2 b2: UIView, Block3 b3: UIView, Block4 b4: UIView, Block5 b5: UIView)
    {
        paddle = p
        ball = b
        block1 = b1
        block2 = b2
        block3 = b3
        block4 = b4
        block5 = b5
        
    }
    init()
    {
        paddle = UIView()
        ball = UIView()
        block1 = UIView()
        block2 = UIView()
        block3 = UIView()
        block4 = UIView()
        block5 = UIView()
        
        
    }
    
    
    

    

    }
    

   

