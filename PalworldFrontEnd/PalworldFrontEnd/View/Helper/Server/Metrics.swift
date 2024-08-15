import SwiftUI


struct Metrics: View {
    
    @ObservedObject var parseData = ParseJSON()
    
    @State private var serverMetrics: ServerMetrics?
    var frametime: Double = 0.2
    var body: some View {
        Button(action: {
            //runButtonAction()
        }){
            ZStack {
                Rectangle()
                    .frame(width: 400 ,height: 150)
                    .cornerRadius(13.0)
                    .foregroundColor(Color(red: 0.286, green: 0.556, blue: 0.725))
                
                    .overlay(alignment: .topLeading){
                        Text("Metrics")
                            .font(.title)
                            .bold()
                            .padding([.leading,.top],20)
                    }
                
                HStack(alignment: .lastTextBaseline){
                    VStack(alignment: .leading,spacing: 20) {
                        Text("Players Online: \(parseData.returnData()?.currentplayernum ?? 0)")
                    }
                    Spacer()
                    VStack(alignment: .trailing,spacing: 20) {
                        Text("Time (ms): \(parseData.returnData()?.serverframetime ?? 0.0)")
                        Text("FPS: \(parseData.returnData()?.serverfps ?? 0)")
                        Text("Uptime: \(parseData.returnData()?.uptime ?? 0)")
                    }
                }.padding([.leading,.trailing],22)
                    .frame(width: 400,height: 150)
            }
        }
        .onAppear{
            parseData.receive()
            parseData.isConnected = true
            Task {await metricBackground(parseData: parseData)}
            //Task {await metricBackground2()}
        }
        .onDisappear{
            parseData.isConnected = false
        }
        .accentColor(.white)
    }
    
    func runButtonAction() {
        parseData.disconnect()
        parseData.connect(urlString: "metric")
    }
}



func metricBackground(parseData: ParseJSON) async {
    
    await Task.detached(priority: .background) {
        while parseData.isNull() {
            parseData.receive()
            try? await Task.sleep(nanoseconds: 500_000_000) // .5 seconds
        }
        
        while parseData.isConnected {
            parseData.parseData()
            try? await Task.sleep(nanoseconds: 60_000_000_000) // 60 seconds
            parseData.receive()
            try? await Task.sleep(nanoseconds: 500_000_000) // .5 seconds
        }
        /* await MainActor.run {
            // Update the UI on the main thread if needed
            print("Background task completed.")
        }*/
    }.value
}

#Preview {
    Metrics(parseData: ParseJSON())
}
