//
//  Group_9_AppApp.swift
//  Group 9 App
//
//  Created by Celeste on 12/11/21.
//

import SwiftUI

@main
struct Group_9_AppApp: App {
    
    @ObservedObject var taskData = TaskData()
    @ObservedObject var goalData = GoalData()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView(tasks: $taskData.tasks, goals: $goalData.goals)
                .onAppear {
                    taskData.load()
                    goalData.load()
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive {
                        taskData.save()
                        goalData.save()
                    }
                }
        }
    }
}
