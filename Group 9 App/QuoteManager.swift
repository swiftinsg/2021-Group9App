//
//  QuoteManager.swift
//  Group 9 App
//
//  Created by MMS on 17/11/21.
//

import Foundation
import SwiftUI

class QuoteManager: ObservableObject{
    
    @Published var quote: Quote?
    
    func getQuote(){
        let apiURL = URL(string: "https://type.fit/api/quotes")!
        let request = URLRequest(url: apiURL)
        
        quote = nil
        
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                DispatchQueue.main.async {
                    let quotes = try? decoder.decode([Quote].self, from: data)
                    self.quote = quotes?.randomElement()
                }
            }
        }.resume()
    }
}
