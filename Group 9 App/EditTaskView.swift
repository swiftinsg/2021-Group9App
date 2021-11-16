//
//  EditTaskView.swift
//  Group 9 App
//
//  Created by MMS on 16/11/21.
//

import SwiftUI

struct EditTaskView: View {
    
    @Binding var task: Task
    var body: some View {
        Form{
            Section(header: Text("Task info")){
                
            }
        }

    }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskView(task: .constant(Task(name: "sus", description: "amogus amogus amogus amogus amogus amogus amogus amogus amogus amogus amogus ", chapters: 5, completed: 2, date: Date().addingTimeInterval(84000))))
    }
}
