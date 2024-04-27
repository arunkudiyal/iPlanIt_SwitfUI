//
//  UpcomingTask.swift
//  iPlanIt-SwiftUI
//
//  Created by Arun Kudiyal on 04/03/24.
//

import SwiftUI

struct AllTaskView: View {
    var allTasks: [Task] = []
    
    init() {
        self.allTasks = AppTaskDataModel().getAllTasks()
    }
    
    var body: some View {
        NavigationStack {
            List(allTasks, id: \.id) { task in
                EmojiRowView(task: task)
            }
        }
    }
}

#Preview {
    AllTaskView()
}
