import SwiftUI
import SwiftUICharts

struct HealthView: View {
    var stressData: [Double] = [8, 2, 4, 6, 12, 9, 2]
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
                LineChart()
                    .data(stressData)
                    .chartStyle(ChartStyle(backgroundColor: .white,
                                           foregroundColor: ColorGradient(.blue, .purple)))
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
