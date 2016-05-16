//
//  WebViewController.swift
//  Breakout
//
//  Created by student1 on 5/16/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var WebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        var URL = NSURL(string: "https://en.wikipedia.org/wiki/Breakout_(video_game)")
        WebView.loadRequest(NSURLRequest(URL: URL!))
    }

    
    @IBAction func myButton1(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
}
