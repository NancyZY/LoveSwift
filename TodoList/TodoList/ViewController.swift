//
//  ViewController.swift
//  TodoList
//
//  Created by Nancy's MacbookPro on 8/1/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

import UIKit

var todos:[TodoModel] = []

var filteredTodos:[TodoModel] = []

func dateFromString(dateStr:String) -> NSDate? {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.dateFromString(dateStr)
    return date
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        todos = [TodoModel(id:"1",image: "child-selected",title: "1.去游乐场",date:dateFromString("2016-08-01")!),
                 TodoModel(id:"2",image: "shopping-cart-selected",title: "2.购物",date:dateFromString("2016-08-01")!),
                 TodoModel(id:"3",image: "phone-selected",title: "3.打电话",date:dateFromString("2016-08-01")!),
                 TodoModel(id:"4",image: "travel-selected",title: "4.旅游",date:dateFromString("2015-04-06")!)
        ]
        
        navigationItem.leftBarButtonItem = editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //DataSource binding
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if tableView == searchDisplayController?.searchResultsTableView{
            return filteredTodos.count
        }else{
            return todos.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell")! as UITableViewCell
        
        let todo : TodoModel
        
        if tableView == searchDisplayController?.searchResultsTableView{
            todo = filteredTodos[indexPath.row] as TodoModel
        }else{
             todo = todos[indexPath.row] as TodoModel
        }
        let image = cell.viewWithTag(101) as! UIImageView
        let title = cell.viewWithTag(102) as! UILabel
        let date = cell.viewWithTag(103) as! UILabel
        
        image.image = UIImage(named: todo.image)
        title.text = todo.title
        
        let locale = NSLocale.currentLocale()
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd", options: 0, locale: locale)
        
        let dateformatter = NSDateFormatter()
        dateformatter.dateFormat = dateFormat
        
        date.text = dateformatter.stringFromDate(todo.date)
        
        
        return cell
    }
    
    
    // UITableViewDelegate
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete {
            todos.removeAtIndex(indexPath.row)
//            self.tableView.reloadData()
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    // EDIT Mode
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: editing)
    }
    
    // MOVE Mode
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool{
        return editing
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath){
        let todo = todos.removeAtIndex(sourceIndexPath.row)
        todos.insert(todo, atIndex: destinationIndexPath.row)
    }
    
    
    // Search
    func UISearchController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool{
        
        filteredTodos = todos.filter(){$0.title.rangeOfString(searchString!) != nil}
        return true
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath:NSIndexPath) -> CGFloat{
        return 80;
    }


    
    
    //NOTE:segue is important for viewcontroller pass arguments,remeber bind exit in main.storybord
    
    @IBAction func close(segue: UIStoryboardSegue){
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditTodo"{
                let vc = segue.destinationViewController as! DetailViewController
                let indexPath = tableView.indexPathForSelectedRow
                if let index = indexPath{
                vc.todo = todos[index.row]
            }
        }
    }

}

