import SwiftUI
import SwiftUICharts

struct HealthView: View {
    @State var stressData: [Double] = [5, 2, 4, 6, 12, 9, 2]
    @State var showFormSheet = false
    @State var showQuoteSheet = false
    @State var showTipsSheet = false
    var body: some View {
        NavigationView{
            List{
                Section{
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
                }
                Section{
                    BarChart()
                        .data(stressData)
                        .chartStyle(ChartStyle(backgroundColor: .white,
                                               foregroundColor: ColorGradient(.blue, .purple)))
                        .frame(height: 300)
                        .padding()
                    Text("                 Overview of the Week")
                }
            }.navigationTitle("Health")
        }.sheet(isPresented: $showQuoteSheet){
            QuotesView()
        }
        .sheet(isPresented: $showFormSheet){
            HealthFormView(data: $stressData)
        }
    }
    
    struct HealthView_Previews: PreviewProvider {
        static var previews: some View {
            HealthView()
        }
    }
}
