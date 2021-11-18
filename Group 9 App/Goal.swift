import Foundation
import SwiftUI

struct Goal: Identifiable, Equatable, Codable {
    var id = UUID()
    var name: String
    var completed: Bool
}
