//
//  TasksTableViewController.swift
//  ToDo
//
//  Created by John Tate on 8/25/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {

    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.shared.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = TaskController.shared.tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        cell.textLabel?.text = task.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        cell.detailTextLabel?.text = dateFormatter.string(from: task.timeStamp)
        if task.isComplete == false {
            cell.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        } else {
            cell.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
        return cell
    }

    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete Logic
            let taskToBeDeleted = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.delete(task: taskToBeDeleted)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
            // Delete Logic
        }
        
    }
    
    
    // MARK: - Navigation
    /*
     I - Identifier
     I - Index Path
     D - DestinationVC
     O - Object we selected
     O - Passing of the Object
    */

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? TaskDetailViewController else {return}
            let taskThatsBeingPassed = TaskController.shared.tasks[indexPath.row]
            destinationVC.task = taskThatsBeingPassed
        }
    }

}
