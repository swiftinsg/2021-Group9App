
import Foundation
import SwiftUI

struct Task: Identifiable, Equatable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var chapters: Int
    var completed: Int
    var date: Date
    
    private func isOverdue(date: Date) -> Bool {
        if date > Date() {
            return false
        }else{
            return true
        }
        
    }
}
