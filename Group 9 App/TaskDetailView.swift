import SwiftUI

struct TaskDetailView: View {
    
    @Binding var task: Task
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        // customise how you want to format the date here
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    @State var showEditSheet = false
    
    var body: some View {
        VStack{
            let progress = CGFloat(task.completed)/CGFloat(task.chapters)
            CircularProgressView(progress: progress, chapters: task.chapters, completed: task.completed)
                .frame(width: 250, height: 250)
                .padding()
            VStack{
            Text("\(task.completed) out of \(task.chapters) chapters completed")
                if task.chapters == task.completed{
                    Text("Great work!")
                }
            }
                .padding()
            Text("\(task.description)")
                .padding()
                .background(Color("customPink"))
                .cornerRadius(15.0)
                .frame(width: 350)
            Spacer()
        }
        .navigationTitle(task.name)
        .toolbar{
            Button{
                showEditSheet = true
            }label:{
                Text("Edit")
            }
        }
        .accentColor(Color(.systemPink))
        .sheet(isPresented: $showEditSheet){
            EditTaskView(task: $task)
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: .constant(Task(name: "Swift task", description: "Udwyfauywdfauywdfauywdfawudfaudwafwudyafwudfawudhawkudha", chapters: 5, completed: 3, date: Date())))
    }
}
