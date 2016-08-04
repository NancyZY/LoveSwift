//
//  TodoModel.swift
//  TodoList
//
//  Created by Nancy's MacbookPro on 8/1/16.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

import UIKit

class TodoModel: NSObject {
    var id: String
    var image: String
    var title:String
    var date:NSDate
    
    init(id:String, image:String, title:String, date:NSDate) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
}
