//
//  AssignmentTableViewController.swift
//  HooStudiez
//
//  Created by Aadil Abbas on 4/15/18.
//  Copyright © 2018 Abbas, Aadil (aa4zw). All rights reserved.
//

import UIKit

class AssignmentTableViewController: UITableViewController {
    var assignments = [Assignment]()


    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleAssignments()
    }
    @IBAction func addButton(_ sender: Any) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "AssignmentTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AssignmentTableViewCell  else {
            fatalError("The dequeued cell is not an instance of AssignmentTableViewCell.")
        }
        
        let assignment = assignments[indexPath.row]

        cell.assignmentNameLabel.text = assignment.title
        cell.assignmentClassLabel.text = assignment.course
        cell.assignmentDueDateLabel.text = assignment.dueDate

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func loadSampleAssignments() {
        guard let assignment1 = Assignment(title: "Milestone", course: "CS 4720", dueDate: "Today" ) else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let assignment2 = Assignment(title: "HW", course: "CS 4750", dueDate: "Tomorrow" ) else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let assignment3 = Assignment(title: "Test", course: "CS 3205", dueDate: "Yesterday" ) else {
            fatalError("Unable to instantiate meal1")
        }
        
        assignments += [assignment1, assignment2, assignment3]

    }

}
