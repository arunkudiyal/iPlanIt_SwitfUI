//
//  TaskEditView.swift
//  iPlanIt-SwiftUI
//
//  Created by Arun Kudiyal on 27/04/24.
//

import SwiftUI

struct TaskEditView: View {
    var body: some View {
        VStack {
//            MapView()
//                .frame(height: 300)
//            
//            
//            CircleImage()
//                .offset(y: -130)
//                .padding(.bottom, -130)
            
            
            VStack(alignment: .leading) {
                Text("Shopping")
                    .font(.title)
                
                
                HStack {
                    Text("Today, 02:00 PM")
                    Spacer()
                    
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                
                Divider()
                
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            
            
            Spacer()
        }
    }
}

#Preview {
    TaskEditView()
}
