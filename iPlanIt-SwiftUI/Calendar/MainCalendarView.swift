//
//  MainCalendarView.swift
//  iPlanIt-SwiftUI
//
//  Created by Arun Kudiyal on 06/03/24.
//

import SwiftUI

struct MainCalendarView: View {
    var body: some View {
        NavigationView {
            CalendarView(inetrval: DateInterval(start: .distantPast, end: .distantFuture))
        }
        .navigationTitle("Calendar")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MainCalendarView()
}
