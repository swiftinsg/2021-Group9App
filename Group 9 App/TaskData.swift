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
    
    let sampleTasks = [Task(name: "sample task!", description: "Create your own task by pressing the + button on the tasks screen", chapters: 5, completed: 0, date: Date()),
                       Task(name: "Swift accel", description: "aaaaah we are behind", chapters: 5, completed: 2, date: Date().addingTimeInterval(86400)),
                       Task(name: "Thing", description: "very thing", chapters: 5, completed: 3, date: Date())]
    
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
