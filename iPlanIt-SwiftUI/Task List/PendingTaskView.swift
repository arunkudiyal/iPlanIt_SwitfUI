//
//  PendingTask.swift
//  iPlanIt-SwiftUI
//
//  Created by Arun Kudiyal on 04/03/24.
//

import SwiftUI

struct PendingTaskView: View {
    var pendingTasks: [Task] = []
    
    init() {
        self.pendingTasks = AppTaskDataModel().getAllTasks().filter({!$0.isCompleted})
    }
    
    var body: some View {
        NavigationStack {
            List(pendingTasks, id: \.id) { task in
                EmojiRowView(task: task)
            }
        }
    }
}

#Preview {
    PendingTaskView()
}
