//
//  AddGoalView.swift
//  Group 9 App
//
//  Created by MMS on 16/11/21.
//

import SwiftUI

struct AddGoalView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var goals: [Goal]
    @State var goal = Goal(name: "", completed: false)
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Goal info")){
                    TextField("Name", text: $goal.name)
                }
                Section(header: Text("Completion")){
                    Toggle("Completed?", isOn: $goal.completed)
                    
                }
                Section{
                    Button{
                        goals.append(goal)
                        presentationMode.wrappedValue.dismiss()
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
            }.navigationTitle("New Goal")
        }
    }
}

struct AddGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalView(goals: .constant([]))
    }
}
