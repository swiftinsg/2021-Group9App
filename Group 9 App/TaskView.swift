import SwiftUI
import SwiftUICharts

struct TasksView: View {
    
    @State var showEditSheet = false
    @Binding var tasks: [Task]
    @State var currentDate = Date()
    @State var showAddSheet = false
    @State var totalChapters = 0
    @State var totalCompleted = 0
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        // customise how you want to format the date here
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    func findTotalChapters(_ list: Array<Task>) -> CGFloat{
        var totalChapters = 0
        for item in list {
            totalChapters += item.chapters
        }
        if totalChapters == 0{
            return 1
        }else{
            return CGFloat(totalChapters)
        }
    }
    func findTotalComplete(_ list: Array<Task>) -> CGFloat{
        var totalCompleted = 0
        for item in list{
            totalCompleted += item.completed
        }
        return CGFloat(totalCompleted)
    }
    func findCompletion(a: CGFloat, b: CGFloat) -> CGFloat{
        let percentage = (a/b)*100
        return percentage
    }
    
    var body: some View {
        var overdueTasks = tasks.filter {
            Calendar.current.compare(Date.now, to: $0.date, toGranularity: .day) == .orderedDescending
        }
        var dueSoonTasks = tasks.filter {
            Calendar.current.compare(Date.now, to: $0.date, toGranularity: .day) != .orderedDescending
        }
        let totalChapters  = findTotalChapters(tasks)
        let totalCompleted = findTotalComplete(tasks)
        let percentage = findCompletion(a: totalCompleted, b: totalChapters)
        NavigationView{
            List{
                Section{
                    VStack(alignment: .leading){
                        Text("Overall Progress")
                            .bold()
                        if tasks.count == 0 {
                            Text("0 completed of 0")
                        }else{
                            Text("\(Double(totalCompleted),specifier: "%.0f") completed of \(Double(totalChapters),specifier: "%.0f")")
                        }
                        Text("Completion: \(Double(percentage),specifier: "%.0f")%")
                        ProgressView(value: totalCompleted, total: totalChapters)
                        
                    }
                }
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
                                        if task.chapters != 0{
                                            ProgressView("Progress: \(Double(findCompletion(a: CGFloat(task.completed), b: CGFloat(task.chapters))),specifier: "%.0f")%",value: CGFloat(task.completed), total: CGFloat(task.chapters))
                                        }else{
                                            ProgressView("Progress: 0%",value: 0, total: 1)
                                        }
                                    }
                                }
                            }
                        }.onDelete { indexSet in
                            let itemsToDelete = indexSet.map{
                                overdueTasks[$0]
                            }
                            tasks.removeAll{
                                itemsToDelete.contains($0)
                            }
                            print(itemsToDelete)
                            overdueTasks.remove(atOffsets: indexSet)
                        }
                    }else{
                        Text("Good work! You have nothing Overdue!")
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
                                        if task.chapters != 0{
                                        ProgressView("Progress: \(Double(findCompletion(a: CGFloat(task.completed), b: CGFloat(task.chapters))),specifier: "%.0f")%",value: CGFloat(task.completed), total: CGFloat(task.chapters))
                                        }else{
                                            ProgressView("Progress: 0%",value: 0, total: 1)
                                        }
                                    }
                                    Spacer()
                                    let redRange = currentDate...currentDate.addingTimeInterval(86400)
                                    let orangeRange = currentDate...currentDate.addingTimeInterval(172800)
                                    let yellowRange = currentDate...currentDate.addingTimeInterval(259200)
                                    if redRange.contains(task.date) {
                                        Image(systemName: "square.fill")
                                            .foregroundColor(.red)
                                    }else if orangeRange.contains(task.date){
                                        Image(systemName: "square.fill")
                                            .foregroundColor(.orange)
                                    }else if yellowRange.contains(task.date){
                                        Image(systemName: "square.fill")
                                            .foregroundColor(.yellow)
                                    }
                                    
                
                                }
                            }
                        }.onDelete { indexSet in
                            let itemsToDelete = indexSet.map{
                                dueSoonTasks[$0]
                            }
                            tasks.removeAll{
                                itemsToDelete.contains($0)
                            }
                            print(itemsToDelete)
                            dueSoonTasks.remove(atOffsets: indexSet)
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
        TasksView(tasks: .constant([]))
    }
}
