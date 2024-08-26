import Foundation

class ParseJSON: ObservableObject {
    
    private var webSocketManager = WebSocketManager()
    @Published var isConnected: Bool = false
    @Published var isActive: Bool = false
    @Published var product: ServerMetrics?
    @Published var parsePlayers: PlayersResponse?
    
    func parseData() {
            let jsonData = webSocketManager.postedMessage
            
            if !jsonData.isEmpty {
                guard let json = jsonData.data(using: .utf8) else {
                    print("Failed to convert jsonData to Data")
                    return
                }
                let decoder = JSONDecoder()
                
                do {
                    let parsedProduct = try decoder.decode(ServerMetrics.self, from: json)
                    DispatchQueue.main.async {
                        self.product = parsedProduct
                    }
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            } else {
                print("jsonData is null, failed to parse JSON - ('\(jsonData)')")
            }
        }

    func parsePlayerData() {
        let jsonData = webSocketManager.postedMessage.data(using: .utf8)!

        // Decode the JSON
        do {
            let playersResponse = try JSONDecoder().decode(PlayersResponse.self, from: jsonData)
            //print("                              \(playersResponse.players[0])") // Output: Lucky
            DispatchQueue.main.async {
                self.parsePlayers = playersResponse
            }
        } catch {
            print("Failed to decode JSON: \(error)")
        }
    }
    
    func connect(urlString: String){
        webSocketManager.isConnected = self.isConnected
        webSocketManager.connect(urlString: urlString)
    }
    
    func receive(){
        webSocketManager.sendMessage()
    }
    
    func sendMessage(messageString: String){
        webSocketManager.sendMessage(messageString)
        webSocketManager.message = ""
    }
    
    func disconnect(){
        webSocketManager.disconnect()
    }

    func isNull() -> Bool {
        return webSocketManager.postedMessage.isEmpty
    }
    
    func printJson(){
        print(webSocketManager.postedMessage)
    }
    
    func returnData() -> ServerMetrics? {
        return product
    }
    
    func returnPlayers() -> PlayersResponse? {
        return parsePlayers
    }
    
    func reset(){
        webSocketManager.resetPosted()
    }
    
    func checkConnection() /*-> Bool*/ {
        webSocketManager.sendPing()
        
        if (self.connected() == true){
            DispatchQueue.main.async {
                self.isConnected = true
            }

            return
        }
        DispatchQueue.main.async {
            self.isConnected = false
        }
        return
    }
    
    func connected() -> Bool {
        return webSocketManager.pingTrue
    }
}
