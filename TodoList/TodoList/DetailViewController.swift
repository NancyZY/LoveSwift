//
//  DetailViewController.swift
//  TodoList
//
//  Created by Nancy's MacbookPro on 8/2/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var shoppingButton: UIButton!
    @IBOutlet weak var airButton: UIButton!
    @IBOutlet weak var todoText: UITextField!
    @IBOutlet weak var todoDate: UIDatePicker!
    
    var todo: TodoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoText.delegate = self
        
        if todo == nil{
            childButton.selected = true
            navigationController?.title = "新增Todo"
        }else{
            navigationController?.title = "修改Todo"
            if todo?.image == "child-selected" {
                childButton.selected = true
            }else if todo?.image == "shopping-cart-selected" {
                shoppingButton.selected = true
            }else if todo?.image == "phone-selected" {
                phoneButton.selected = true
            }else if todo?.image == "travel-selected" {
                airButton.selected = true
            }
            
            todoText.text = todo?.title
            todoDate.setDate((todo?.date)!, animated:false)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func childTapped(sender: AnyObject) {
        resetButtons()
        childButton.selected = true
    }

    func resetButtons(){
        childButton.selected = false
        phoneButton.selected = false
        shoppingButton.selected = false
        airButton.selected = false
    }
    @IBAction func phoneTapped(sender: AnyObject) {
        resetButtons()
        phoneButton.selected = true
    }
    
    @IBAction func shoppingTapped(sender: AnyObject) {
        resetButtons()
        shoppingButton.selected = true
    }
    
    
    @IBAction func airTappped(sender: AnyObject) {
        resetButtons()
        airButton.selected = true
    }
    
    
    @IBAction func okTapped(sender: AnyObject) {
        var image = ""
        if childButton.selected {
            image = "child-selected"
        }else if phoneButton.selected{
            image = "phone-selected"
        }else if shoppingButton.selected{
            image = "shopping-cart-selected"
        }else if airButton.selected{
            image = "travel-selected"
        }
        
        if todo == nil{
            let uuid = NSUUID().UUIDString
            let todo = TodoModel(id:uuid, image: image, title: todoText.text!, date:todoDate.date)
            todos.append(todo)
        }else{
            todo?.image = image
            todo?.date = todoDate.date
            todo?.title = todoText.text!
            
        }
        
    }
    
    // click Enter key the keyboard dismiss
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // click outside of textview the keyboard dismiss
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        todoText.resignFirstResponder()
    }
}
