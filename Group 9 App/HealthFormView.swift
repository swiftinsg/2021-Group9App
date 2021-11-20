//
//  HealthFormView.swift
//  Group 9 App
//
//  Created by Celeste on 17/11/21.
//

import SwiftUI

struct HealthFormView: View {
    let options = ["0","1","2","3","4"]
    @Binding var data: Array<Double>
    @State private var Q1 = ""
    @State var Q2 = ""
    @State var Q3 = ""
    @State var Q4 = ""
    @State var Q5 = ""
    @State var showErrorAlert = false
    @State var total = 0
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Question 1")){
                        Text("How often have you felt upset because of something unexpected recently?")
                        Picker("0 being the least 4 being the most", selection: $Q1){
                            ForEach(options, id: \.self){
                                Text($0)
                            }
                        }
                    }
                    Section(header: Text("Question 2")){
                        Text("How often have you felt unable to control the important things in your life?")
                        Picker("0 being the least 4 being the most", selection: $Q2){
                            ForEach(options, id: \.self){
                                Text($0)
                            }
                        }
                        
                    }
                    Section(header: Text("Question 3")){
                        Text("How often have you felt nervous and “stressed”?")
                        Picker("0 being the least 4 being the most", selection: $Q3){
                            ForEach(options, id: \.self){
                                Text($0)
                            }
                        }
                        
                    }
                    Section(header: Text("Question 4")){
                        Text("How often have you felt doubtful about your ability to handle your personal problems?")
                        Picker("0 being the least 4 being the most", selection: $Q4){
                            ForEach(options, id: \.self){
                                Text($0)
                            }
                        }
                        
                    }
                    Section(header: Text("Question 5")){
                        Text("How often have you found that you could not cope with all the things that you had to do?")
                        Picker("0 being the least 4 being the most", selection: $Q5){
                            ForEach(options, id: \.self){
                                Text($0)
                            }
                        }
                        
                    }
                    Section(footer: Text("Questions based on the Percieved Stress Scale by Sheldon Cohen. This is not a medical assesment, just a rough scale, see a psychologist if you are feeling mentally unwell.")){
                        Button{
                            if let q1 = Int(Q1), let q2 = Int(Q2), let q3 = Int(Q3), let q4 = Int(Q4), let q5 = Int(Q5){
                                total = q1 + q2 + q3 + q4 + q5
                                data.append(Double(total))
                                presentationMode.wrappedValue.dismiss()
                            }else{
                                showErrorAlert = true
                            }
                        }label:{
                            Text("Submit")
                        }
                        Button{
                            presentationMode.wrappedValue.dismiss()
                        }label:{
                            Text("Discard")
                                .foregroundColor(.red)
                        }
                    }
                }
            }.navigationTitle(Text("Stress Form"))
                .alert(isPresented: $showErrorAlert){
                    Alert(title: Text("Error"),
                          message: Text("Invalid input! Please fill in all fields."),
                          primaryButton: .default(Text("Dismiss")),
                          secondaryButton: .destructive(Text("Discard")){
                        presentationMode.wrappedValue.dismiss()
                    })
                }
        }
    }
}
struct HealthFormView_Previews: PreviewProvider {
    static var previews: some View {
        HealthFormView(data: .constant([]))
    }
}
