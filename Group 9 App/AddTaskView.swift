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
    @State var showAlert = false
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
                        if Int(completed)! <= Int(chapters)!{
                            tasks.append(Task(name: name, description: description, chapters: Int(chapters)!, completed: Int(chapters)!, date: date))
                        presentationMode.wrappedValue.dismiss()
                        }else{
                            showAlert = true
                        }
                    }
                    Button("Discard"){
                        presentationMode.wrappedValue.dismiss()
                    }.foregroundColor(.red)
                }
            }.navigationTitle("New Task")
                .alert(isPresented: $showAlert){
                    Alert(title: Text("Error"),
                          message: Text("Invalid input! Please check again."),
                          primaryButton: .default(Text("Dismiss")),
                          secondaryButton: .destructive(Text("Discard")){
                        presentationMode.wrappedValue.dismiss()
                    })
                }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(tasks: .constant([]))
    }
}
