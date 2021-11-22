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
        VStack(alignment: .center){
            Text("Quote! ✍️")
                .bold()
                .padding()
                .frame(width: 150, height: 50)
            
            if let quote = quoteManager.quote{
                Text(quote.text)
                    .multilineTextAlignment(.center)
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
                .background(Color("Watermelon"))
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
