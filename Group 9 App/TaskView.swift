import SwiftUI

struct TasksView: View {
    
    @State var showEditSheet = false
    @State var tasks = [Task(name: "Swift accel", description: "aaaaah we are behind", chapters: 5, completed: 2, date: Date()),
                        Task(name: "thing", description: "very thing", chapters: 5, completed: 3, date: Date())]
    @State var currentDate = Date()
    @State var showAddSheet = false
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        // customise how you want to format the date here
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Overdue")){
                    ForEach(0..<tasks.count){ index in
                        NavigationLink(destination: TaskDetailView(task: $tasks[index])){
                            HStack{
                                VStack(alignment: .leading){
                                    Text(tasks[index].name)
                                        .bold()
                                    Text(formatDate(tasks[index].date))
                                }
                            }
                        }
                    }
                }
                Section(header: Text("Due Soon")){
                    ForEach(0..<tasks.count){ index in
                        NavigationLink(destination: TaskDetailView(task: $tasks[index])){
                            HStack{
                                VStack(alignment: .leading){
                                    Text(tasks[index].name)
                                        .bold()
                                    Text(formatDate(tasks[index].date))
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
                    AddTaskView()
                    
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
