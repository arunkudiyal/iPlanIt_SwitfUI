import SwiftUI

struct ContentView: View {
    let date = Date.now.formatted()
    var body: some View {
        TabView {
            Group {
                NavigationStack {
                    Spacer()
                    Home()
                }
                .tabItem {
                    Label("Today", systemImage: "doc.text.image")
                }
                    
                SharingView()
                    .tabItem {
                        Label("Sharing", systemImage: "person.2")
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}

#Preview {
    ContentView()
}
