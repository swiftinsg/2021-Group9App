import SwiftUI

struct GoalsView: View {
    @State var goals = [Goal(name: "feed the cat", completed: false), Goal(name: "Feed dog", completed: true)]
    
    var body: some View {
        NavigationView{
            List(goals){ goal in
                HStack{
                    Text(goal.name)
                        .bold()
                    HStack{
                        Image(systemName: goal.completed ? "checkmark.square.fill":"square")
                            .foregroundColor(Color(.systemPink))
                            .frame(alignment: .topTrailing)
                    }
                }
                
            }.navigationTitle("Goals")
        }
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
