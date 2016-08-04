//
//  ViewController.swift
//  OnDateApp
//
//  Created by Nancy's MacbookPro on 7/29/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var heightData: UILabel!
    @IBOutlet weak var height: UISlider!
    @IBOutlet weak var hasPropties: UISwitch!
    @IBOutlet weak var result: UITextView!
    @IBOutlet weak var gender: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func heightChanged(sender: AnyObject) {
        let slider = sender as! UISlider
        heightData.text = "\(String(Int(slider.value))) cm"
    }
    

    @IBAction func okTapped(sender: AnyObject) {
        let genderText = gender.selectedSegmentIndex == 0 ? "高富帅":"白富美"
        let hasPropertyText = hasPropties.on ? "有房" : "无房"
        result.text = "\(name.text) , \(genderText), \(hasPropertyText), 求交往"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toSecond"{
             segue.destinationViewController as! SecondViewController
        }
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
    }
}

