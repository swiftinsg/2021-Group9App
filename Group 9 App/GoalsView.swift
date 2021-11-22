import SwiftUI

struct GoalsView: View {
    @Binding var goals: [Goal]
    @State var showAddSheet = false
    var body: some View {
        NavigationView{
            List {
                if goals.count == 0{
                    Text("Get started by adding some goals using the + button!")
                }
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
                                    .foregroundColor(Color("Watermelon"))
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
                .toolbar{
                    Button{
                        showAddSheet = true
                    }label:{
                        Text("+")
                            .foregroundColor(Color("Watermelon"))
                            .bold()
                    }
                }
                .sheet(isPresented: $showAddSheet){
                    AddGoalView(goals: $goals)
                }
        }.accentColor(Color("Watermelon"))
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView(goals: .constant([]))
    }
}
