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
        
        
        let paddle = UIView(frame: CGRect(x: 200, y: 200, width: 80, height: 20))
        paddle.backgroundColor = UIColor.blueColor()
        view.addSubview(paddle)
        
        
    }
}
