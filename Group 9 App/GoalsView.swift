import SwiftUI

struct GoalsView: View {
    @State var goals = [Goal(name: "feed the cat", completed: false), Goal(name: "Feed dog", completed: true)]
    
    var body: some View {
        NavigationView{
            List {
                ForEach(goals){ goal in
                    Button{
                        let goalIndex = goals.firstIndex(of: goal)!
                        goals[goalIndex].completed.toggle()
                        
                    } label: {
                        HStack{
                            Text(goal.name)
                                .bold()
                                .foregroundColor(.black)
                            ZStack{
                                Image(systemName: goal.completed ? "checkmark.square.fill":"square")
                                    .foregroundColor(Color(.systemPink))
                            }
                        }
                    }
                    
                }.onDelete { indexSet in
                    goals.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    goals.move(fromOffsets: indices, toOffset: newOffset)
                }
            }.navigationTitle("Goals")
                .navigationBarItems(leading: EditButton())
        }
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
