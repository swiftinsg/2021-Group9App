import SwiftUI

struct GoalsView: View {
    @State var goals = [Goal(name: "feed the cat", completed: false), Goal(name: "Feed dog", completed: true)]
    @State var showAddSheet = false
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
                            Spacer()
                            ZStack{
                                Image(systemName: goal.completed ? "checkmark.square.fill":"square")
                                    .foregroundColor(Color(.systemPink))
                            }
                        }
                    }
                    
                }.onDelete { indexSet in
                    goals.remove(atOffsets: indexSet)
                }
            }.navigationTitle("Goals")
                .navigationBarItems(leading: EditButton())
                .toolbar{
                    Button{
                        showAddSheet = true
                    }label:{
                        Text("+")
                            .foregroundColor(Color(.systemPink))
                            .bold()
                    }
                }
                .sheet(isPresented: $showAddSheet){
                    AddGoalView(goals: $goals)
                }
        }.accentColor(Color(.systemPink))
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
