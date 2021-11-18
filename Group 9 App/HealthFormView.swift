//
//  HealthFormView.swift
//  Group 9 App
//
//  Created by Celeste on 17/11/21.
//

import SwiftUI

struct HealthFormView: View {
    let options = ["1","2","3","4"]
    @Binding var data: Array<Any>
    @State private var Q1 = ""
    @State var Q2 = ""
    @State var Q3 = ""
    @State var Q4 = ""
    @State var Q5 = ""
    @State var showErrorAlert = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Question 1")){
                        Text("How often have you felt upset because of something unexpected recently?")
                        Picker("1 being the least 4 being the most", selection: $Q1){
                            ForEach(options, id: \.self){
                                Text($0)
                            }
                        }
                    }
                    Section(header: Text("Question 2")){
                        Text("How often have you felt unable to control the important things in your life?")
                        Picker("1 being the least 4 being the most", selection: $Q2){
                            ForEach(options, id: \.self){
                                Text($0)
                            }
                        }
                        
                    }
                    Section(header: Text("Question 3")){
                        Text("In the last month, how often have you felt nervous and “stressed”?")
                        Picker("1 being the least 4 being the most", selection: $Q3){
                            ForEach(options, id: \.self){
                                Text($0)
                            }
                        }
                        
                    }
                    Section(header: Text("Question 4")){
                        Text("In the last month, how often have you felt confident about your ability to handle your personal problems?")
                        Picker("1 being the least 4 being the most", selection: $Q4){
                            ForEach(options, id: \.self){
                                Text($0)
                            }
                        }
                        
                    }
                    Section(header: Text("Question 5")){
                        Text("In the last month, how often have you found that you could not cope with all the things that you had to do?")
                        Picker("1 being the least 4 being the most", selection: $Q5){
                            ForEach(options, id: \.self){
                                Text($0)
                            }
                        }
                        
                    }
                    Section{
                        Button{
                            do{
                                let total = try Int(Q1)! + Int(Q2)! + Int(Q3)! + Int(Q4)! + Int(Q5)!
                                data.append(total)
                            }catch{
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
        }
    }
}
struct HealthFormView_Previews: PreviewProvider {
    static var previews: some View {
        HealthFormView(data: .constant([]))
    }
}
