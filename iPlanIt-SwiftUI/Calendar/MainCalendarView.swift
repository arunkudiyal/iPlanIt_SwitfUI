//
//  MainCalendarView.swift
//  iPlanIt-SwiftUI
//
//  Created by Arun Kudiyal on 06/03/24.
//

import SwiftUI

struct MainCalendarView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            CalendarView(inetrval: DateInterval(start: .distantPast, end: .distantFuture))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            // .aspectRatio(contentMode: .fill)
            // .offset(y: -270)
        }
        .navigationBarTitle("Calendar")
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Done")
                })
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MainCalendarView()
}
