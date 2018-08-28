//
//  Task.swift
//  ToDo
//
//  Created by John Tate on 8/25/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

import Foundation

class Task: Codable, Equatable {
    var name: String
    var description: String
    var isComplete: Bool
    var timeStamp: Date
    
    init(name: String, description: String, isComplete: Bool = false, timeStamp: Date = Date()) {
        self.name = name
        self.description = description
        self.isComplete = isComplete
        self.timeStamp = Date()
    }
    
    static func == (lhs: Task, rhs: Task) -> Bool {
//      return  lhs.name == rhs.name && lhs.description == rhs.description
        if lhs.name == rhs.name && lhs.description == rhs.description {
            return true
        } else {
            return false
        }
    }
    
}
