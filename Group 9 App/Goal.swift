import Foundation
import SwiftUI

struct Goal: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var completed: Bool
}
