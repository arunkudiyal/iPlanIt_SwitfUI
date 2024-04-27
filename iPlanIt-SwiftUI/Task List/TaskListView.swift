//
//  TaskList.swift
//  iPlanIt-SwiftUI
//
//  Created by Arun Kudiyal on 04/03/24.
//

import SwiftUI

struct TaskListView: View {
    
    @State private var showAddTask = false
    @State private var isActive = false
    @State private var current = "Pending"
    
    var tasks = ["Pending", "All", "Completed"]
    var allTasks: [Task] = []
    
    init() {
        self.allTasks = AppTaskDataModel().getAllTasks()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Picker("", selection: $current) {
                        ForEach(tasks, id: \.self) {
                            Text($0)
                        }
                        .padding()
                    }
                    .pickerStyle(.segmented)
                    switch current {
                    case "Pending":
                        PendingTaskView()
                    case "All":
                        AllTaskView()
                    case "Completed":
                        CompletedTaskView()
                    default:
                        PendingTaskView()
                    }
                }
            }
        }
        .navigationTitle("Task List")
        .toolbarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    showAddTask = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
        }
        
        .sheet(isPresented: $showAddTask) {
            NavigationView {
                AddTaskView()
                    // .offset(y: -150)
            }
        }
    }
}

#Preview {
    TaskListView()
}
