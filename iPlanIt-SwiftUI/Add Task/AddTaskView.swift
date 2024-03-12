//
//  AddTaskView.swift
//  iPlanIt-SwiftUI
//
//  Created by Arun Kudiyal on 09/03/24.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var eventName = ""
    
    @State private var allDay = false
    
    @State private var startTime = Date()
    @State private var endTime = Date()
    
    @State private var breakStartTime = Date()
    @State private var breakEndTime = Date()
    
    @State private var tasKRepeat = "never"
    
    @State private var addBreak = false
    
    @State private var meditation = false
    
    let colors = ["Never", "Every Day", "Every Week", "Every 2 Weeks", "Every Month", "Every Year"]
    
    var body: some View {
        NavigationView {
            VStack {
                Circle()
                    .frame(height: 100)
                Text("Event Name")
                    .font(.title)
                    
                Form {
                    Section {
                        TextField("Event Name", text: $eventName)
                    }
                    
                    Section {
                        Toggle(isOn: $allDay) {
                            Text("All Day")
                        }
                        DatePicker("Starts", selection: $startTime)
                        DatePicker("Ends", selection: $endTime)
                    }
                    
                    Section {
                        Picker("Repeat", selection: $tasKRepeat) {
                            ForEach(colors, id: \.self) { color in
                                Text(color).tag(color)
                            }
                        }
                    }
                    
                    Section(footer: Text("Adding breaks helps you take time for a quick break or to meditate")) {
                        Toggle(isOn: $meditation) {
                            Text("Add Break")
                        }
                    }
                    
                    Section(footer: Text("Meditation helps you take break in between of your breaks.")) {
                        Toggle(isOn: $addBreak) {
                            Text("Add Meditation")
                        }
                        if(addBreak) {
                            DatePicker("Starts", selection: $breakStartTime)
                            DatePicker("Ends", selection: $breakEndTime)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("New Event")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                } label: {
                    Label("", systemImage: "")
                }
                .padding()
                .background(
                    NavigationLink("Done", destination: TaskListView())
                )
                .padding()
            }
        }
    }
}

#Preview {
    AddTaskView()
}
