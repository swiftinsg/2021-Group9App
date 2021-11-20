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
    var score: Int
    var totalPoints: Int
    @State var optionQ1 = 0
    @State var optionQ2 = 0
    @State var optionQ3 = 0
    @State var optionQ4 = 0
    @State var optionQ5 = 0
    @State var totalScore = 0
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
    func didTapOption(optionNumber: Int){
        if optionNumber == 0{
            optionQ1 += 0
            optionQ2 += 0
            optionQ3 += 0
            optionQ4 += 0
            optionQ5 += 0
            totalScore += 0
        }
        if optionNumber == 1{
            optionQ1 += 1
            optionQ2 += 1
            optionQ3 += 1
            optionQ4 += 1
            optionQ5 += 1
            totalScore += 1
        }
        if optionNumber == 2{
            optionQ1 += 2
            optionQ2 += 2
            optionQ3 += 2
            optionQ4 += 2
            optionQ5 += 2
            totalScore += 2
        }
        if optionNumber == 3{
            optionQ1 += 3
            optionQ2 += 3
            optionQ3 += 3
            optionQ4 += 3
            optionQ5 += 3
            totalScore += 3
        }
        if optionNumber == 4{
            optionQ1 += 4
            optionQ2 += 4
            optionQ3 += 4
            optionQ4 += 4
            optionQ5 += 4
            totalScore += 4
        }
    }
}
struct HealthFormView_Previews: PreviewProvider {
    static var previews: some View {
        HealthFormView(data: .constant([]), score: 3, totalPoints: 20)
    }
}
