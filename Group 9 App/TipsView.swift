//
//  TipsView.swift
//  Group 9 App
//
//  Created by MMS on 22/11/21.
//

import SwiftUI

struct TipsView: View {
    let tips = ["Complete your goals one by one before embarking on a new journey!",
    "Don’t fear your boundaries, remember that everything you want is just outside your comfort zone! Push a little harder, just a little, and you’ll be there.",
    "Have alternate ways to win the day. When you push your comfort zone, there will be disappointments, so consider setting alternate goals for each day to reduce feelings of disappointment. (you can use our app’s goals function too!)",
    "Familiarity doesn't mean knowing",
    "Think of the results when you achieve your goal",
    "Remember to take short breaks",
    "Just do it. Do it now. Stop procrastinating",
    "Always get enough sleep as it is important for reducing stress",
    "Break down your work and task each and every one to a timeslot",
    "Know when to stop Have a guilt-free stopping time for the night, and stick to it. This might sound counter-intuitive as an exam study tip but it’s an important one! Enjoying some proper time off will increase your motivation and productivity the following day.",
    "Take some quality time off  your life.",
    "Always plan appropriate workload do not overwork and overplan more than you can do",
    "STOP distraction power off your phone and put it away as it decreases the productivity",
    "Choose good study environments and  more productive ones",
    "Everyone has their own preferred method to study, find what is right for you and stick to it",
    "Keep a distraction list so that you can focus on the work at hand and and worry about other thing later",
    "Make hydration a habit when studying",
    "Use flashcards for key notes",
    "Do practice papers without notes and check what you got right",
    "Learn from mistakes and prioritise visiting them",
    "Interleaving habits. Do short burst of different topics in the same subjects",
    "Complete and check your work, do not succumb to careless mistakes"]
    @State var tip = ""
    @State var previous = ""
    var body: some View {
        VStack{
            Text("Study Tip 💡")
                .bold()
                .padding()
            Text(tip)
                .padding()
                .multilineTextAlignment(.center)
            Button{
                tip = tips.randomElement()!
                while tip == previous{
                    tip = tips.randomElement()!
                }
                previous = tip
            }label:{
                Text("Another tip!")
                    .frame(width: 110, height: 50)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            .background(Color("Watermelon"))
            .frame(width: 110, height: 50)
            .cornerRadius(10)
        }.onAppear(){
            tip = tips.randomElement()!
            previous = tip
        }
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}
