//
//  TaskController.swift
//  ToDo
//
//  Created by John Tate on 8/25/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

import Foundation

class TaskController {
    // Singleton / Shared Instance
    static let shared = TaskController()
    
    // SOT = Source of Truth, Data Source
    var tasks: [Task] = []
    
    // CRUD  = Create Rad Update Delete
    
    func createTask(name: String, description: String) {
        let createdTask = Task(name: name, description: description)
        tasks.append(createdTask)
        save()
    }
    
    func delete(task: Task) {
        if let indexOfTaskBeingDeleted = tasks.index(of: task) {
            tasks.remove(at: indexOfTaskBeingDeleted)
        }
        save()
    }
    
    func update(task: Task, name: String, description: String, timeStamp: Date = Date(), isComplete: Bool) {
        task.name = name
        task.description = description
        task.timeStamp = timeStamp
        task.isComplete = isComplete
        save()
    }
    
    // Persistence
    func save() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(tasks)
            try data.write(to: fileURL())
        } catch {
            print("Error saving to persistence: \(error.localizedDescription)")
        }
    }
    
    func loadTasks() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedTasks = try decoder.decode([Task].self, from: data)
            self.tasks = decodedTasks
        } catch {
            print("Error loading from persistence: \(error.localizedDescription)")
        }
    }
    
    // Get URL from File Manager
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "Task.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    
}
