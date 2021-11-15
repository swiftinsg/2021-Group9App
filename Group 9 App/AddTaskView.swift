import SwiftUI

struct AddTaskView: View {
    @State var task = Task(name: "", description: "", chapters: 0, completed: 0, date: Date())
    @Environment(\.presentationMode) var presentationMode
    @State var totalChapters = ""
    @State var completedChapters = ""
    @State var error = false
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("task info")){
                    TextField("Name",text: $task.name)
                    TextField("Description", text: $task.description)
                }
                Section(header: Text("Chapters")){
                    TextField("Total chapters", text: $totalChapters)
                        .keyboardType(.numberPad)
                    TextField("Complete chapters", text: $completedChapters)
                        .keyboardType(.numberPad)
                    
                }
                Section(header: Text("Deadline")){
                    DatePicker("When is the task due?", selection: $task.date, displayedComponents: [.date])
                }
                Section{
                    Button("Save"){
                        
                    }
                    Button("Discard"){
                        
                    }.foregroundColor(.red)
                }
            }.navigationTitle("Add Task")
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
