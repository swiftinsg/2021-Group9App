import SwiftUI

struct HealthView: View {
    @State var showAddSheet = false
    var body: some View {
        NavigationView{
            List{
                Button("Health Form"){
                    showAddSheet = true
                }
                Button("Quote of the Day"){
                    
                }
                Button("Advice of the Day"){
                    
                }
                //inserts chart here
                Text("Overview of the Week")
            }.navigationTitle("Health")
        }
    }
    
    struct HealthView_Previews: PreviewProvider {
        static var previews: some View {
            HealthView()
        }
    }
}
