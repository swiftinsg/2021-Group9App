
import Foundation
import SwiftUI

struct Task: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var chapters: Int
    var completed: Int
    var date: Date
    var progress: CGFloat
    
    private func isOverdue(date: Date) -> Bool {
        if date > Date() {
            return false
        }else{
            return true
        }
        
    }
    private func progressCalculator(a: Int, b: Int) -> CGFloat{
        return CGFloat(a/b)
    }
}
