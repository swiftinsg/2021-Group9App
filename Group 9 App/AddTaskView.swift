import SwiftUI

struct AddTaskView: View {
    @State var task = Task(name: "", description: "", chapters: 0, completed: 0, date: Date())
    @Environment(\.presentationMode) var presentationMode
    @Binding var tasks: [Task]
    @State var name = ""
    @State var date = Date()
    @State var description = ""
    @State var completed = ""
    @State var chapters = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("task info")){
                    TextField("Name",text: $name)
                    TextField("Description", text: $description)
                }
                Section(header: Text("Chapters")){
                    TextField("Total chapters", text: $chapters)
                        .keyboardType(.numberPad)
                    TextField("Complete chapters", text: $completed)
                        .keyboardType(.numberPad)
                    
                }
                Section(header: Text("Deadline")){
                    DatePicker("When is the task due?", selection: $date, displayedComponents: [.date])
                }
                Section{
                    Button("Save"){
                        tasks.append(Task(name: name, description: description, chapters: Int(chapters)!, completed: Int(completed)!, date: date))
                        presentationMode.wrappedValue.dismiss()
                    }
                    Button("Discard"){
                        presentationMode.wrappedValue.dismiss()
                    }.foregroundColor(.red)
                }
            }.navigationTitle("Add Task")
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(tasks: .constant([]))
    }
}
