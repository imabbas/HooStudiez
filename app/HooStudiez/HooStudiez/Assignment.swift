//
//  Assignment.swift
//  HooStudiez
//
//  Created by Aadil Abbas on 4/15/18.
//  Copyright © 2018 Abbas, Aadil (aa4zw). All rights reserved.
//

import Foundation

class Assignment {
    
    //MARK: Properties
    
    var title: String
    var course: String
    var dueDate: String
    
    
    init?(title: String, course: String, dueDate: String) {
        if title.isEmpty || course.isEmpty  {
            return nil
        }
        
        // Initialize stored properties.
        self.title = title
        self.course = course
        self.dueDate = dueDate
        
        
    }
    
}



