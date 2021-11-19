//
//  CircularProgressView.swift
//  Group 9 App
//
//  Created by MMS on 19/11/21.
//

import SwiftUI

struct CircularProgressView: View {
    
    @State var progress: CGFloat
    @State var chapters: Int
    @State var completed: Int
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(.pink)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: .init(lineWidth: 20.0,
                                     lineCap: .round,
                                     lineJoin: .round))
                .foregroundColor(.pink)
                .rotationEffect(Angle(degrees: 270))
            let percentage = (CGFloat(completed)/CGFloat(chapters))*100
            VStack{
                Text("\(Double(percentage),specifier: "%.0f")%")
                    .bold()
                    .padding()
                if chapters == completed{
                    Text("Congrats!")
                }
            }
        }
    }
}


struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.7, chapters: 10, completed: 10)
    }
}
