//
//  AddTaskView.swift
//  iPlanIt-SwiftUI
//
//  Created by Arun Kudiyal on 09/03/24.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var eventName = ""
    
    @State private var allDay = false
    
    @State private var startTime = Date()
    @State private var endTime = Date()
    
    @State private var breakStartTime = Date()
    @State private var breakEndTime = Date()
    
    @State private var meditationStartTime = Date()
    @State private var meditationEndTime = Date()
    
    @State private var tasKRepeat = "Never"
    
    @State private var alert = "None"
    
    @State private var addBreak = false
    
    @State private var meditation = false
    
    let repeats = ["Never", "Every Day", "Every Week", "Every 2 Weeks", "Every Month", "Every Year"]
    
    let alerts = ["None", "At time of event", "5 minutes before", "10 minutes before", "15 minutes before", "30 minutes before", "1 hour before", "2 hour before", "1 day before", "2 days before", "1 week before"]
    
    let breaks = ["1 minute", "2 minutes", "5 minutes", "10 minutes", "15 minutes", "30 minutes"]
    
    var body: some View {
        NavigationView {
            VStack {
                Circle()
                    .frame(height: 100)
                Text("\(eventName)")
                    .font(.title)
                    
                Form {
                    Section {
                        TextField("Event Name", text: $eventName)
                    }
                    
                    Section {
                        Toggle(isOn: $allDay) {
                            Text("All Day")
                        }
                        if(!allDay) {
                            DatePicker("Starts", selection: $startTime)
                            DatePicker("Ends", selection: $endTime)
                        } else {
                            DatePicker("On", selection: $startTime, in: ...Date.now, displayedComponents: .date)
                        }
                    }
                    
                    Section {
                        Picker("Repeat", selection: $tasKRepeat) {
                            ForEach(repeats, id: \.self) { repeatTask in
                                Text(repeatTask).tag(repeatTask)
                            }
                        }
                    }
                    
                    Section(footer: Text("Adding break helps you take quick breaks or to meditate")) {
                        Toggle(isOn: $meditation) {
                            Text("Add Break")
                        }
                        if(meditation) {
                            Picker("Duration", selection: $tasKRepeat) {
                                ForEach(breaks, id: \.self) { taskBreak in
                                    Text(taskBreak).tag(taskBreak)
                                }
                            }
                        }
                    }
                    
                    Section(footer: Text("Include meditation to your break")) {
                        if(!meditation) {
                            Toggle(isOn: $addBreak) {
                                Text("Add Meditation")
                            }
                            .disabled(true)
                        } else {
                            Toggle(isOn: $addBreak) {
                                Text("Add Meditation")
                            }
                            .disabled(false)
                        }
                        
                    }
                    
                    Section {
                        Picker("Alert", selection: $alert) {
                            ForEach(alerts, id: \.self) { alert in
                                Text(alert).tag(alert)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("New Event")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Done")
                })
            }
        }
    }
}

#Preview {
    AddTaskView()
}
