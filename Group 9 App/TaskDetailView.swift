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
        }
        .navigationTitle(task.name)
    }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task:.constant(Task(name: "swift task", description: "Udwyfauywdfauywdfauywdfawudfaudwafwudyafwudfawudhawkudha", chapters: 5, completed: 3, date: Date())))
    }
}
