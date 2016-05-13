//  Will Buccola
//  Yorgos Floutsakos
//  Theo Kozil
//  Izhan Arif
//  ViewController.swift
//  Breakout
//
//  Created by student1 on 5/2/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PauseBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
      NSThread.sleepForTimeInterval(2)
        
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 2.0, initialSpringVelocity: 15, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            self.PauseBtn.center.x = self.view.frame.width
        }), completion: nil)
    
    }
}

