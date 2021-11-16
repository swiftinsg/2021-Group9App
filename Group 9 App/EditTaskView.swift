//
//  EditTaskView.swift
//  Group 9 App
//
//  Created by MMS on 16/11/21.
//

import SwiftUI

struct EditTaskView: View {
    @State var showErrorAlert = false
    @Binding var task: Task
    @State var totalChapters = ""
    @State var name = ""
    @State var date = Date()
    @State var completedChapters = ""
    @State var description = ""
    @State var newTask = Task(name: "", description: "", chapters: 0, completed: 0, date: Date())
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Task info")){
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                    
                }
                Section(header: Text("Total chapters")){
                    TextField("Total chapters",text: $totalChapters)
                    
                }
                Section(header: Text("Completed Chapters")){
                    TextField("Completed chapters", text: $completedChapters)
                }
                Section(header: Text("Deadline")){
                    DatePicker("When is this due?", selection: $date, displayedComponents: [.date])
                }
                Section{
                    Button{
                        if Int(completedChapters)! <= Int(totalChapters)!{
                            task = Task(name: name, description: description, chapters: Int(totalChapters)!, completed: Int(completedChapters)!, date: date)
                            presentationMode.wrappedValue.dismiss()
                        }else{
                            showErrorAlert = true
                        }
                    }label:{
                        Text("Save")
                    }
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    }label:{
                        Text("Discard")
                            .foregroundColor(.red)
                    }
                }
            }.navigationTitle(Text("Edit Task"))
        }.onAppear(){
            newTask = task
            name = task.name
            totalChapters = String(task.chapters)
            completedChapters = String(task.completed)
            date = task.date
            description = task.description
            
        }
    }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskView(task: .constant(Task(name: "sus", description: "amogus amogus amogus amogus amogus amogus amogus amogus amogus amogus amogus ", chapters: 5, completed: 2, date: Date().addingTimeInterval(84000))))
    }
}
