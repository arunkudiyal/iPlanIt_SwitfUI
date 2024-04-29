//
//  Home.swift
//  iPlanIt-SwiftUI
//
//  Created by Arun Kudiyal on 04/03/24.
//

import SwiftUI

struct Home: View {
    
    @State private var showCalendar = false
    @State private var showDate = false
    
    @State private var isTaskListActive = false
    @State private var isActive: Bool = false
    
    var date = Date()
    var dateString: String
    var completedTask: Int
    var totalTasks: Int
    
    var allTasks: [Task]
    
    init() {
        self.dateString = date.formatted(.dateTime.weekday(.wide).day().month())
        self.completedTask = AppTaskDataModel().getAllTasks().filter({$0.isCompleted}).count
        self.totalTasks = AppTaskDataModel().getAllTasks().count
        
        self.allTasks = AppTaskDataModel().getAllTasks()
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack {
                        HStack(alignment: .bottom) {
                            HStack {
                                Text("")
                            }
                        }
                    }
                    
                    
                    Button(action: {
                        isTaskListActive = true
                    }) {
                        HStack(alignment: .center) {
                            HStack(alignment: .center) {
                                HStack {
                                    Circle()
                                        .frame(height: 200)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                            }
                            .cornerRadius(10.0)
                        }
                    }
                    .background(
                        NavigationLink("", destination: TaskListView(), isActive: $isTaskListActive)
                    )
                    
                    VStack {
                        VStack(alignment: .center) {
                            VStack {
                                Text("Tasks Completed".uppercased(with: .autoupdatingCurrent))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.callout)
                                Text("⭐️ \(completedTask)/\(totalTasks) Tasks Completed")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.headline).bold()
                                    .foregroundColor(.green)
                            }
                            Divider()
                            VStack {
                                Text("Ongoing Task".uppercased(with: .autoupdatingCurrent))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.callout)
                                Text("\(allTasks[0].emoji) \(allTasks[0].title)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.headline).bold()
                            }
                            Divider()
                            VStack {
                                Text("Upcoming Task".uppercased(with: .autoupdatingCurrent))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.callout)
                                Text("\(allTasks[1].emoji) \(allTasks[1].title)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.headline).bold()
                            }
                        }
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    }
                    
                    
                    Divider()
                    
                    VStack {
                        Text("Achievements")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title2)
                            .bold()
                            .padding()
                        HStack() {
                            VStack {
                                Image("Badge")
                                    .resizable()
                                    .frame(width: 80, height: 90)
                                Text("")
                            }
                            VStack {
                                Image("Badge")
                                    .resizable()
                                    .frame(width: 80, height: 90)
                                Text("")
                            }
                            VStack {
                                Image("Badge")
                                    .resizable()
                                    .frame(width: 80, height: 90)
                                Text("")
                            }
                            VStack {
                                Image("Badge")
                                    .resizable()
                                    .frame(width: 80, height: 90)
                                Text("")
                            }
                        }
                        Spacer()
                            .padding()
                    }
                    Spacer()
                } }
        }
        .overlay(
                Text("Some Random Text")
                    .padding(.trailing, 20)
                    .offset(x: 0, y: -50)
            , alignment: .topTrailing
        )
        .navigationTitle("Today")
        .navigationBarTitleDisplayMode(.automatic)
        .toolbar {
            ToolbarItem {
                Button {
                    showCalendar = true
                    print(showCalendar)
                } label: {
                    Image(systemName: "calendar")
                }
            }
            if showDate {
                ToolbarItem(placement: .topBarLeading) {
                    Text("\(dateString)").font(.headline)
                        .foregroundStyle(.secondary)
                }
            }
        }
        
        .sheet(isPresented: $showCalendar) {
            NavigationView {
                MainCalendarView()
            }
        }
    }
}


#Preview {
    Home()
}
