//
//  HealthFormView.swift
//  Group 9 App
//
//  Created by Celeste on 17/11/21.
//

import SwiftUI

struct ScoreView: View {
    @State var Q1 = ""
    @State var Q2 = ""
    @State var Q3 = ""
    @State var Q4 = ""
    @State var Q5 = ""
    var body: some View {
        VStack {
            Text("Q1.")
            Text("Q2.")
            Text("Q3.")
            Text("Q4.")
            Text("Q5.")
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
