//
//  CompletedTask.swift
//  iPlanIt-SwiftUI
//
//  Created by Arun Kudiyal on 04/03/24.
//

import SwiftUI

struct CompletedTaskView: View {
    
    var completedTasks: [Task]
    
    init() {
        self.completedTasks = AppTaskDataModel().getAllTasks().filter({$0.isCompleted})
    }
    
    var body: some View {
        List(completedTasks, id: \.id) { task in
            EmojiRowView(task: task)
        }
    }
}

#Preview {
    CompletedTaskView()
}
