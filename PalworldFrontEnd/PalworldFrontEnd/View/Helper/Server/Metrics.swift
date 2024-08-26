import SwiftUI


struct Metrics: View {
    
    @ObservedObject var parseData = ParseJSON()
    @State private var serverMetrics: ServerMetrics?
    
    @State private var metricTask: Task<Void, Never>? = nil
    var frametime: Double = 0.2
    private var firstRun: Bool = true
    
    var body: some View {
        Button(action: {
            runButtonAction()
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
            metricTask?.cancel()
            metricTask = Task {await metricBackground(parseData: parseData)}
        }
        
        .onDisappear{
            metricTask?.cancel()
            print("Cancelled")
            parseData.isConnected = false
            //firstRun
            parseData.disconnect()
            print("Disconnected")
            
            
            
            
            
        }
        .accentColor(.white)
    }
    
    func runButtonAction() {
        //parseData.checkConnection()
    }
    
    
    func metricBackground(parseData: ParseJSON) async {
        
        await Task.detached(priority: .background) {
            
            parseData.reset()
            
            parseData.connect(urlString: "metric")
            
            parseData.checkConnection()
            
            print("Connected")
            
            while parseData.isNull() {
                parseData.receive()
                try? await Task.sleep(nanoseconds: 100_000_000) // .1 seconds
            }
            
            repeat {
                parseData.parseData()
                
                for _ in 1...30{
                    try? await Task.sleep(nanoseconds: 2_000_000_000) // 2 second * 30 loops = 60ish seconds
                    
                    if(parseData.isConnected == false){
                        break
                    }
                }
                
                if(parseData.isConnected == true){
                    parseData.receive()
                }
                
            } while parseData.isConnected == true
        }.value
    }
    
}





#Preview {
    Metrics()
}
