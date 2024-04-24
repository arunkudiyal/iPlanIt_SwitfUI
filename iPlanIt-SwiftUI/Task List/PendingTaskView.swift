//
//  PendingTask.swift
//  iPlanIt-SwiftUI
//
//  Created by Arun Kudiyal on 04/03/24.
//

import SwiftUI

struct PendingTaskView: View {
    var pendingTaks: [Task] = []
    
    init() {
        self.pendingTaks = AppTaskDataModel().getAllTasks().filter({!$0.isCompleted})
    }
    
    var body: some View {
        List(pendingTaks) { task in
            VStack {
                HStack {
                    Text("\(task.emoji)")
                        .font(.largeTitle)
                        .padding(8)
                    VStack(alignment: .leading) {
                        Text("\(task.title)")
                        Text("\(task.time)")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    if(task.flag != .five) {
                        if(task.flag == .one) { Image(systemName: "flag") .foregroundColor(.red) }
                        else if(task.flag == .two) { Image(systemName: "flag") .foregroundColor(.blue) }
                        else if(task.flag != .three) { Image(systemName: "flag") .foregroundColor(.green) }
                        else if(task.flag != .four) { Image(systemName: "flag") .foregroundColor(.yellow) }
                    }
                    
                }
                
            }
        }
    }
}

#Preview {
    PendingTaskView()
}
