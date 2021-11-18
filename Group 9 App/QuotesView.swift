//
//  QuotesView.swift
//  Group 9 App
//
//  Created by MMS on 17/11/21.
//

import SwiftUI

struct QuotesView: View {
    
    @ObservedObject var quoteManager = QuoteManager()
    
    var body: some View {
        VStack{
            if let quote = quoteManager.quote{
                Text(quote.text)
                    .padding()
            }else{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }
            Button{
                quoteManager.getQuote()
            }label:{
                Text("New Quote!")
                    .foregroundColor(.white)
                
            }.padding()
                .background(Color.pink)
                .cornerRadius(10.0)
        }.onAppear(){
            quoteManager.getQuote()
        }
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView()
    }
}
