import SwiftUI

struct TasksView: View {
    
    @State var showEditSheet = false
    @State var tasks = [Task(name: "Swift accel", description: "aaaaah we are behind", chapters: 5, completed: 2, date: Date().addingTimeInterval(86400)),
                        Task(name: "Thing", description: "very thing", chapters: 5, completed: 3, date: Date())]
    @State var currentDate = Date()
    @State var showAddSheet = false
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        // customise how you want to format the date here
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    
    var body: some View {
        var overdueTasks = tasks.filter {
            Calendar.current.compare(Date.now, to: $0.date, toGranularity: .day) == .orderedDescending
        }
        var dueSoonTasks = tasks.filter {
            Calendar.current.compare(Date.now, to: $0.date, toGranularity: .day) != .orderedDescending
        }
        NavigationView{
            List{
                Section(header: Text("Overdue")){
                    if overdueTasks.count != 0{
                        ForEach(overdueTasks){ task in
                            let taskIndex = tasks.firstIndex(of: task)!
                            NavigationLink(destination: TaskDetailView(task: $tasks[taskIndex])){
                                HStack{
                                    VStack(alignment: .leading){
                                        Text(task.name)
                                            .bold()
                                        Text(formatDate(task.date))
                                    }
                                }
                            }
                        }.onDelete { indexSet in
                            overdueTasks.remove(atOffsets: indexSet)
                            tasks.remove(atOffsets: indexSet)
                        }
                    }else{
                        Text("Good work! you have nothing Overdue!")
                    }
                }
                Section(header: Text("Due Soon")){
                    if dueSoonTasks.count != 0{
                        ForEach(dueSoonTasks){ task in
                            let taskIndex = tasks.firstIndex(of: task)!
                            NavigationLink(destination: TaskDetailView(task: $tasks[taskIndex])){
                                HStack{
                                    VStack(alignment: .leading){
                                        Text(task.name)
                                            .bold()
                                        Text(formatDate(task.date))
                                    }
                                }
                            }
                        }.onDelete { indexSet in
                            dueSoonTasks.remove(atOffsets: indexSet)
                            tasks.remove(atOffsets: indexSet)
                        }
                    }else{
                        Text("Get started by adding some tasks!")
                    }
                }
            }.listStyle(InsetGroupedListStyle())
                .navigationTitle("Tasks")
                .navigationBarItems(leading: EditButton())
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
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
