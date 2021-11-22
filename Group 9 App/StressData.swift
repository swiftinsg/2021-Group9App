//
//  StressData.swift
//  Group 9 App
//
//  Created by MMS on 22/11/21.
//

import Foundation
import SwiftUI

class StressData: ObservableObject {
    @Published var stress: [Double] = []
    
    let sampleStress = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    
    func getArchiveURL() -> URL {
        let plistName = "models.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedStresses = try? propertyListEncoder.encode(stress)
        try? encodedStresses?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalStresses: [Double]!
        
        if let retrievedStressData = try? Data(contentsOf: archiveURL),
            let decodedStresses = try? propertyListDecoder.decode([Double].self, from: retrievedStressData) {
            finalStresses = decodedStresses
        } else {
            finalStresses = sampleStress
        }
        
        stress = finalStresses
    }
}
