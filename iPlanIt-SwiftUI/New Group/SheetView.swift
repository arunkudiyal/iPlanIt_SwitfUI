//
//  SheetView.swift
//  iPlanIt-SwiftUI
//
//  Created by Arun Kudiyal on 14/03/24.
//

import SwiftUI

struct SheetView: View {
   @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
           Button {
              dismiss()
           } label: {
               HStack {
                   Text("Cancel")
                   Spacer()
                   Text("Done")
               }
           }
         }
         .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
         .padding()
    }
}

#Preview {
    SheetView()
}
