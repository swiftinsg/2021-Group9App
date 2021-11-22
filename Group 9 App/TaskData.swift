//
//  TaskData.swift
//  Group 9 App
//
//  Created by MMS on 18/11/21.
//

import Foundation
import SwiftUI

class TaskData: ObservableObject {
    @Published var tasks: [Task] = []
    
    let sampleTasks = [] as Array<Task>
    
    func getArchiveURL() -> URL {
        let plistName = "tasks.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTasks = try? propertyListEncoder.encode(tasks)
        try? encodedTasks?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalTasks: [Task]!
        
        if let retrievedTaskData = try? Data(contentsOf: archiveURL),
           let decodedTasks = try? propertyListDecoder.decode([Task].self, from: retrievedTaskData) {
            finalTasks = decodedTasks
        } else {
            finalTasks = sampleTasks
        }
        
        tasks = finalTasks
    }
}
