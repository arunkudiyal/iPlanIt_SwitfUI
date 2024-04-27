import SwiftUI

struct EmojiRowView: View {
    
    var task: Task
    
    var body: some View {
        VStack {
            HStack {
                Text("\(task.emoji)")
                    .font(.largeTitle)
                    .padding(8)
                VStack(alignment: .leading) {
                    Text("\(task.title)")
                    Text("\(task.time)")
                        .foregroundColor(.gray)
                }
                Spacer()
                
                if(task.flag != .five) {
                    if(task.flag == .one) { Image(systemName: "flag") .foregroundColor(.red) }
                    else if(task.flag == .two) { Image(systemName: "flag") .foregroundColor(.blue) }
                    else if(task.flag != .three) { Image(systemName: "flag") .foregroundColor(.green) }
                    else if(task.flag != .four) { Image(systemName: "flag") .foregroundColor(.yellow) }
                }
                
            }
            
        }
    }
}

#Preview {
    Group {
        EmojiRowView(task: AppTaskDataModel().getAllTasks()[0])
        EmojiRowView(task: AppTaskDataModel().getAllTasks()[1])
    }
}
