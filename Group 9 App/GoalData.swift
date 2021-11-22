//
//  GoalData.swift
//  Group 9 App
//
//  Created by MMS on 18/11/21.
//

import Foundation
import SwiftUI

class GoalData: ObservableObject {
    @Published var goals: [Goal] = []
    
    let sampleGoals = [] as Array<Goal>
    
    func getArchiveURL() -> URL {
        let plistName = "goals.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedGoals = try? propertyListEncoder.encode(goals)
        try? encodedGoals?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalGoals: [Goal]!
        
        if let retrievedGoalData = try? Data(contentsOf: archiveURL),
           let decodedGoals = try? propertyListDecoder.decode([Goal].self, from: retrievedGoalData) {
            finalGoals = decodedGoals
        } else {
            finalGoals = sampleGoals
        }
        
        goals = finalGoals
    }
}
