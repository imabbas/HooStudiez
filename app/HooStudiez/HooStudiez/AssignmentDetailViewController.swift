//
//  AssignmentDetailViewController.swift
//  HooStudiez
//
//  Created by Abbas, Aadil (aa4zw) on 4/16/18.
//  Copyright © 2018 Abbas, Aadil (aa4zw). All rights reserved.
//

import UIKit
import CoreData

class AssignmentDetailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var assignmentNameTextField: UITextField!
    @IBOutlet weak var assignmentCourseTextField: UITextField!
    @IBOutlet weak var assignmentDateTextField: UITextField!
    
    @IBAction func addAssignment(_ sender: Any) {
        if let name = assignmentNameTextField.text, let course = assignmentCourseTextField.text, let date = assignmentDateTextField.text {
            self.saveAssignment(name: name, course: course, date: date)
        } else {
            print("Input fields cannot be blank!")
        }
    }
    
    
//    @IBAction func loadData(_ sender: UIButton) {
//
//        guard let appDelegate =
//            UIApplication.shared.delegate as? AppDelegate else {
//                return
//        }
//
//        let managedContext = appDelegate.persistentContainer.viewContext
//
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
//
//
//        do {
//
//            let persons = try managedContext.fetch(fetchRequest)
//            let person = persons.last
//
//            nameLabel.text = person?.value(forKey: "name") as! String
//            compIDLabel.text = person?.value(forKey: "compID") as! String
//
//
//        } catch let error as NSError {
//            print("Could not fetch. \(error), \(error.userInfo)")
//        }
//
//    }
    
    func saveAssignment(name:String, course:String, date:String) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "MyAssignments", in: managedContext)
        let item = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        item.setValue(name, forKey: "name")
        item.setValue(course, forKey: "course")
        item.setValue(date, forKey: "date")

        do {
            try managedContext.save()
        } catch _ {
            print("Unable to save Assignment")
        }
        
        // print info from Core Data
        var assignments  = [MyAssignments]() //
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MyAssignments")
        do {
            try assignments = managedContext.fetch(fetchRequest) as! [MyAssignments]
        } catch _ {
            print("error")
        }
        
        // Then you can use your properties.
        
        for assignment in assignments {
            
            print("Assignment Name : " + assignment.name!)
            print("Course : " + assignment.course!)
            print("Due Date : " + assignment.date!)

        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AssignmentDetailViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
