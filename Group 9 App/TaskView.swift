import SwiftUI

struct TasksView: View {
    
    @State var showEditSheet = false
    @State var tasks = [Task(name: "Swift accel", description: "aaaaah we are behind", chapters: 5, completed: 2, date: Date().addingTimeInterval(86400), deadline: Date().addingTimeInterval(86400)),
                        Task(name: "Thing", description: "very thing", chapters: 5, completed: 3, date: Date(), deadline: Date())]
    @State var currentDate = Date()
    @State var showAddSheet = false
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        // customise how you want to format the date here
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Overdue")){
                    ForEach($tasks){ $task in
                        NavigationLink(destination: TaskDetailView(task: $task)){
                            HStack{
                                VStack(alignment: .leading){
                                    Text(task.name)
                                        .bold()
                                    Text(formatDate(task.date))
                                }
                            }
                        }
                    }
                }
                Section(header: Text("Due Soon")){
                    ForEach($tasks){ $task in
                        NavigationLink(destination: TaskDetailView(task: $task)){
                            HStack{
                                VStack(alignment: .leading){
                                    Text(task.name)
                                        .bold()
                                    Text(formatDate(task.date))
                                }
                                .navigationTitle("Tasks")
                                .navigationBarItems(leading: EditButton())
                            }
                        }
                    }
                }
            }.listStyle(InsetGroupedListStyle())
                .navigationTitle("Tasks")
                .toolbar {
                    Button{
                        showAddSheet.toggle()
                    }label:{
                        Text("+")
                            .bold()
                            .foregroundColor(Color(.systemPink))
                        
                    }.sheet(isPresented: $showAddSheet){
                        AddTaskView(tasks: $tasks)
                    }
                }
        }.accentColor(Color(.systemPink))
        let overdueTasks = tasks.filter {
            Calendar.current.compare(Date.now, to: $0.deadline, toGranularity: .day) == .orderedDescending
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
