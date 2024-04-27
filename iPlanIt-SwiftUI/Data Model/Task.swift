//
//  Suggestion.swift
//  iPlanIt-SwiftUI
//
//  Created by Arun Kudiyal on 04/03/24.
//

import SwiftUI

enum FlagType {
    case one, two, three, four, five
}

struct Task: Identifiable, Hashable {
    var id: UUID
    var title: String
    var emoji: String
    var time: String
    var date: String
    var includeBreak: Bool
    var breakStartTime: String
    var breakEndTime: String
    var meditation: Bool
    var resources: String
    var isCompleted: Bool
    var flag: FlagType
    init(id: UUID, title: String, emoji: String, time: String, date: String, includeBreak: Bool, breakStartTime: String, breakEndTime: String, meditation: Bool, resources: String, isCompleted: Bool, flag: FlagType) {
        self.id = id
        self.title = title
        self.emoji = emoji
        self.time = time
        self.date = date
        self.includeBreak = includeBreak
        self.breakStartTime = breakStartTime
        self.breakEndTime = breakEndTime
        self.meditation = meditation
        self.resources = resources
        self.isCompleted = isCompleted
        self.flag = flag
    }
}

class AppTaskDataModel {
    var tasks: [Task] = []
    /// Sample Task Data
    init() {
        tasks.append( Task(id: UUID(), title: "Salon", emoji: "💇‍♀️",  time: "7:11 PM", date: "2024-01-31", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "", isCompleted: true, flag: .five ) )
        
        tasks.append(Task(id: UUID(), title: "Groceries", emoji: "🛒", time: "7:11 PM", date: "2024-01-31", includeBreak: true, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "7:11 PM", isCompleted: false, flag: .one))
        
        tasks.append(Task(id: UUID(), title: "Coffee Meeting", emoji: "☕️", time: "7:11 PM", date: "2024-01-31", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: true, resources: "7:11 PM", isCompleted: false, flag: .five))
        
        tasks.append(Task(id: UUID(), title: "Gym", emoji: "🏋️", time: "7:11 PM", date: "2024-01-31", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "", isCompleted: true, flag: .four))
        
        tasks.append(Task(id: UUID(), title: "Lunch", emoji: "🍔", time: "7:11 PM", date: "2024-01-31", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "", isCompleted: false, flag: .five))
        
        tasks.append(Task(id: UUID(), title: "Watch Movie", emoji: "🎬", time: "7:11 PM", date: "2024-01-31", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "7:11 PM", isCompleted: true, flag: .five))
        
        tasks.append(Task(id: UUID(), title: "Soccer Practice", emoji: "⚽️", time: "7:11 PM", date: "2024-01-31", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "7:11 PM", isCompleted: false, flag: .four))
        
        tasks.append(Task(id: UUID(), title: "Lectures", emoji: "💻", time: "7:11 PM", date: "2024-01-31", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "", isCompleted: false, flag: .four))
        
        tasks.append(Task(id: UUID(), title: "Check For Emails", emoji: "📧", time: "7:11 PM", date: "2024-01-31", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "7:11 PM", isCompleted: true, flag: .three))
        
        tasks.append(Task(id:  UUID(), title: "Take Meds", emoji: "💊", time: "7:11 PM", date: "2024-01-31", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "7:11 PM", isCompleted: false, flag: .five))
        
        tasks.append(Task(id:  UUID(), title: "Quick Run", emoji: "🏃", time: "7:11 PM", date: "2024-01-31", includeBreak: false, breakStartTime: "7:11 PM", breakEndTime:"7:11 PM", meditation: false, resources: "7:11 PM", isCompleted: false, flag: .four))
    }
    
    func getAllTasks() -> [Task] { return self.tasks }
    
    func addTask(task: Task) {
        self.tasks.append(task)
    }
    
    func getTaskById(id: UUID) -> Task { self.tasks.filter({ $0.id.uuidString == id.uuidString })[0] }

}

var taskDataModel = AppTaskDataModel()

