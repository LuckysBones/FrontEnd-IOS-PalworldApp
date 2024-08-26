import Foundation

class WebSocketManager: ObservableObject {
    
    private var webSocketTask: URLSessionWebSocketTask?
    private var urlSession: URLSession
    private var urlString: String = ""
    
    @Published var message: String = ""
    @Published var postedMessage: String = ""
    @Published var isConnected: Bool = true
    @Published var pingTrue: Bool = false
    
    init() {
        urlSession = URLSession(configuration: .default)
    }
    
    func connect(urlString: String) {
        self.urlString = urlString
        guard let url = URL(string:"wss://luckyspalworldserver.com/ws/\(urlString)/") else { return }
        webSocketTask = urlSession.webSocketTask(with: url)
        webSocketTask?.resume()
        sleep(1)
        receiveMessage()
    }
    
    func sendMessage() {
        let tempMessage = URLSessionWebSocketTask.Message.string(" ")
        webSocketTask?.send(tempMessage) { error in
            if let error = error {
                print("WebSocket sending error: \(error)")
            }
        }
    }
    
    func sendMessage(_ message: String) {
        let message = URLSessionWebSocketTask.Message.string(message)
        webSocketTask?.send(message) { error in
            if let error = error {
                print("WebSocket sending error: \(error)")
            }
        }
    }
    
    func sendMessage(_ message: String, _ numShut: Int) {
        let message = URLSessionWebSocketTask.Message.string(message)
        webSocketTask?.send(message) { error in
            if let error = error {
                print("WebSocket sending error: \(error)")
            }
        }
    }
    
    func receiveMessage() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .failure(let error):
                if(self?.isConnected == true){
                    print("WebSocket receiving error: \(error)")
                }
            case .success(let postedMessage):
                switch postedMessage {
                case .string(let text):
                    self?.postedMessage = text
                case .data(let data):
                    print("Received data: \(data)")
                @unknown default:
                    fatalError()
                }
                self?.receiveMessage()
            }
        }
    }
    
    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
        isConnected = false
    }
    
    func sendPing() {
        webSocketTask?.sendPing(pongReceiveHandler: { error in
            if let error = error {
                print("Ping failed with error: \(error)")
                self.pingTrue = false
            } else {
                print("Pong received successfully")
                self.pingTrue = true
            }
        })
    }
    
    func resetPosted(){
        self.postedMessage = ""
    }
}
