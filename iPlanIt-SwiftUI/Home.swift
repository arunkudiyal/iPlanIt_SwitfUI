//
//  Home.swift
//  iPlanIt-SwiftUI
//
//  Created by Arun Kudiyal on 04/03/24.
//

import SwiftUI

struct Home: View {
    var date = Date()
    var dateString: String
    var completedTask: Int
    var totalTasks: Int
    
    var allTasks: [Task]
    
    init() {
        self.dateString = date.formatted(.dateTime.weekday().month().day().year() )
        self.completedTask = AppTaskDataModel().getAllTasks().filter({$0.isCompleted}).count
        self.totalTasks = AppTaskDataModel().getAllTasks().count
        
        self.allTasks = AppTaskDataModel().getAllTasks()
    }
    
    var body: some View {
            VStack {
                HStack(alignment: .bottom) {
                    HStack {
                        Text("")
                    }
                    .navigationTitle("Today")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text(" \(dateString) ")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                            } label: {
                                Label("", systemImage: "")
                            }
                            .padding()
                            .background(
                                NavigationLink("Calendar", destination: MainCalendarView())
                            )
                            .padding()
                        }
                    }
                }
            }
            
        
        HStack(alignment: .center) {
            HStack(alignment: .center) {
                HStack {
                    Circle()
                        .frame(height: 200)
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                Spacer()
                
                HStack(alignment: .top) {
                    Button {
                    } label: {
                        Label("", systemImage: "")
                    }
                    .padding()
                    .background( NavigationLink("More", destination: TaskListView()), alignment: .top )
                }
                .padding()
            }
            .cornerRadius(10.0)
        }
        
        VStack {
            VStack {
                VStack {
                        Text("Tasks Completed")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                        Text("⭐️ \(completedTask)/\(totalTasks) Tasks Completed")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3).bold()
                            .foregroundColor(.green)
                    }
                Divider()
                VStack {
                        Text("Ongoing Task")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                    Text("\(allTasks[0].emoji) \(allTasks[0].title)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3).bold()
                }
                Divider()
                VStack {
                    Text("Upcoming Task")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                    Text("\(allTasks[1].emoji) \(allTasks[1].title)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3).bold()
                    }
            }
            .padding()
        }
        
            
        Divider()
            
        VStack {
            Text("Achievements")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                    .bold()
                    .padding()
            HStack() {
                Image("Badge")
                        .resizable()
                        .frame(width: 80, height: 90)
                Image("Badge")
                        .resizable()
                        .frame(width: 80, height: 90)
                        .opacity(0.5)
                Image("Badge")
                        .resizable()
                        .frame(width: 80, height: 90)
                        .opacity(0.5)
                Image("Badge")
                        .resizable()
                        .frame(width: 80, height: 90)
                        .opacity(0.5)
            }
            Spacer()
                .padding()
        }
            
        Spacer()
    }
}


#Preview {
    Home()
}
