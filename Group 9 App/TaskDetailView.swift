import SwiftUI

struct TaskDetailView: View {
    
    @Binding var task: Task
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        // customise how you want to format the date here
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    
    var body: some View {
        NavigationView{
            ZStack(alignment:.topLeading){
                Text(formatDate(task.date))
                    .position(x: 65, y: 15)
                ZStack{
                    Circle()
                        .stroke(lineWidth: 20)
                        .opacity(0.3)
                        .foregroundColor(.pink)
                    
                    Circle()
                        .trim(from: 0, to: CGFloat(task.completed)/CGFloat(task.chapters))
                        .stroke(style: .init(lineWidth: 20.0,
                                             lineCap: .round,
                                             lineJoin: .round))
                        .foregroundColor(.pink)
                        .rotationEffect(Angle(degrees: 270))
                    Text("\(String((CGFloat(task.completed)/CGFloat(task.chapters)) * 100))%")
                    
                }
                .frame(width: 150, height: 150)
                .position(x: 200, y: 160)
                Text("\(task.completed) Out of \(task.chapters) Topics")
                    .position(x: 200, y: 280)
                Text("\(task.description)")
                    .position(x: 200, y: 350)
            }
            
            .navigationTitle(task.name)
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: .constant(Task(name: "Swift task", description: "Udwyfauywdfauywdfauywdfawudfaudwafwudyafwudfawudhawkudha", chapters: 5, completed: 3, date: Date())
    }
}
