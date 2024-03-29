import SwiftUI
import SwiftUICharts

struct HealthView: View {
    @Binding var stressData: [Double]
    @State var showFormSheet = false
    @State var showQuoteSheet = false
    @State var showTipsSheet = false
    var body: some View {
        NavigationView{
            List{
                Section{
                    VStack{
                        HStack{
                            Spacer()
                            Text("Recent stress levels")
                            Spacer()
                        }
                        Text("Based on input from stress form")
                            
                    }
                    BarChart()
                        .data(stressData)
                        .chartStyle(ChartStyle(backgroundColor: .white,
                                               foregroundColor: ColorGradient(Color("customPink"), .pink)))
                        .frame(height: 300)
                        .padding()
                }
                Section{
                    Button{
                        showFormSheet = true
                    }label:{
                        Text("Stress Form")
                            .foregroundColor(Color("Watermelon"))
                    }
                    Button{
                        showQuoteSheet = true
                    }label:{
                        Text("Motivational Quote!")
                            .foregroundColor(Color("Watermelon"))
                    }
                    Button{
                        showTipsSheet = true
                    }label:{
                        Text("Study Tips")
                            .foregroundColor(Color("Watermelon"))
                    }
                }
            }.navigationTitle("Health")
        }.sheet(isPresented: $showQuoteSheet){
            QuotesView()
        }
        .sheet(isPresented: $showFormSheet){
            HealthFormView(data: $stressData)
        }
        .sheet(isPresented: $showTipsSheet){
            TipsView()
        }
    }
    
    struct HealthView_Previews: PreviewProvider {
        static var previews: some View {
            HealthView(stressData: .constant([0.00,15.00,17.00,14.00,24.00,6.00,18.00]))
        }
    }
}
