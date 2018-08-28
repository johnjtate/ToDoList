//
//  TaskDetailViewController.swift
//  ToDo
//
//  Created by John Tate on 8/25/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    var task: Task?
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var isCompleteSwitch: UISwitch!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var isCompleteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let task = task {
            updateViews(task: task)
        } else {
            isCompleteSwitch.isHidden = true
            isCompleteLabel.isHidden = true
        }
    }
    
    @IBAction func switchToggled(_ sender: Any) {
        if isCompleteSwitch.isOn == true {
            view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        } 
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        print("Clear button tapped")
        taskNameTextField.text = ""
        descriptionTextView.text = ""
        isCompleteSwitch.isOn = false
        view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        print("Save button tapped")
        let isComplete =  isCompleteSwitch.isOn
        guard let taskName = taskNameTextField.text, let description = descriptionTextView.text else {return}
        
        if let taskThatsBeingUpdated = task {
            // Update Logic
            TaskController.shared.update(task: taskThatsBeingUpdated, name: taskName, description: description, isComplete: isComplete)
            // Update Logic
        } else {
            // Create Logic
            TaskController.shared.createTask(name: taskName, description: description)
            // Create Logic
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews(task: Task) {
        taskNameTextField.text = task.name
        descriptionTextView.text = task.description
        isCompleteSwitch.isOn = task.isComplete
        if task.isComplete == true {
            view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
    }


}
