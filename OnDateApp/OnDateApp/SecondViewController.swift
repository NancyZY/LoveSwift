//
//  SecondViewController.swift
//  OnDateApp
//
//  Created by Nancy's MacbookPro on 8/1/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

import UIKit
import Social

class SecondViewController : UIViewController{
    @IBAction func shareTapped(sender: AnyObject) {
        let controller : SLComposeViewController = SLComposeViewController(forServiceType:SLServiceTypeTwitter)
        self.presentViewController(controller,animated:true,completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}