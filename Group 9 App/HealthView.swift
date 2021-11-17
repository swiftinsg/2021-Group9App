import SwiftUI
import SwiftUICharts

struct HealthView: View {
    var stressData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    @State var showFormSheet = false
    @State var showQuoteSheet = false
    @State var showTipsSheet = false
    var body: some View {
        NavigationView{
            List{
                Button{
                    showFormSheet = true
                }label:{
                    Text("Health Form")
                        .foregroundColor(Color(.systemPink))
                }
                Button{
                    showQuoteSheet = true
                }label:{
                    Text("Motivational Quote!")
                        .foregroundColor(Color(.systemPink))
                }
                Button{
                    showTipsSheet = true
                }label:{
                   Text("Study Tips")
                        .foregroundColor(Color(.systemPink))
                }
                LineChart()
                    .data(stressData)
                    .chartStyle(ChartStyle(backgroundColor: .white,
                                           foregroundColor: ColorGradient(.blue, .purple)))
                Text("                Overview of the Month")
            }.navigationTitle("Health")
        }.sheet(isPresented: $showQuoteSheet){
            QuotesView()
        }
    }
    
    struct HealthView_Previews: PreviewProvider {
        static var previews: some View {
            HealthView()
        }
    }
}
