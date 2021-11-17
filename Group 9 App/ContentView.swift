import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TasksView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Tasks")
                }
            GoalsView()
                .tabItem {
                    Image(systemName: "moon.stars")
                    Text("Goals")
                    
                }
            HealthView()
                .tabItem {
                    Image(systemName: "heart.circle")
                    Text("Health")
                    
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
