import SwiftUI

struct TaskDetailView: View {
    
    @Binding var task: Task
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        // customise how you want to format the date here
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    @State var showEditSheet = false
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text(formatDate(task.date))
                    .frame(width: 350, alignment: .leading)
            }
            let progress = CGFloat(task.completed)/CGFloat(task.chapters)
            ZStack{
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                    .foregroundColor(Color("Watermelon"))
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(style: .init(lineWidth: 20.0,
                                         lineCap: .round,
                                         lineJoin: .round))
                    .foregroundColor(Color("Watermelon"))
                    .rotationEffect(Angle(degrees: 270))
                let percentage = (CGFloat(task.completed)/CGFloat(task.chapters))*100
                VStack{
                    if task.chapters > 0{
                        Text("\(Double(percentage),specifier: "%.0f")%")
                            .bold()
                            .padding()
                        if task.chapters == task.completed{
                            Text("Congrats!")
                        }
                    }else{
                        Text("0%")
                            .bold()
                            .padding()
                    }
                }
            }
            .frame(width: 250, height: 250)
            .padding()
            VStack{
                Text("\(task.completed) out of \(task.chapters) chapters completed")
                if task.chapters == task.completed{
                    if task.chapters != 0{
                        Text("Great work!")
                    }
                }
            }
            .padding()
            HStack{
                Button{
                    if task.completed < task.chapters{
                        withAnimation{
                            task.completed += 1
                        }
                    }
                }label: {
                    Text("+1 completed")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                }
                .frame(width: 125, height: 45)
                .background(Color("CherryBlossom"))
                .cornerRadius(10)
                Button{
                    if task.completed > 0{
                        withAnimation{
                            task.completed -= 1
                        }
                    }
                }label:{
                    Text("-1 completed")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                    
                }
            
                .frame(width: 125, height: 45)
                .background(Color("CherryBlossom"))
                .cornerRadius(10)
            }
            Text("\(task.description)")
                .padding()
                .background(Color("customPink"))
                .cornerRadius(15.0)
                .frame(width: 350)
                .padding()
            Spacer()
        }
        .navigationTitle(task.name)
        .toolbar{
            Button{
                showEditSheet = true
            }label:{
                Text("Edit")
            }
        }
        .accentColor(Color(.systemPink))
        .sheet(isPresented: $showEditSheet){
            EditTaskView(task: $task)
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: .constant(Task(name: "Swift task", description: "Udwyfauywdfauywdfauywdfawudfaudwafwudyafwudfawudhawkudha", chapters: 5, completed: 3, date: Date())))
    }
}
