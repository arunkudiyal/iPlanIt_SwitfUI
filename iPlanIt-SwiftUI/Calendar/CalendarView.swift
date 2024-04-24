//
//  CalendarView.swift
//  iPlanIt-SwiftUI
//
//  Created by Arun Kudiyal on 04/03/24.
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
    
    let inetrval: DateInterval
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = inetrval
        return view
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        return
    }
}
