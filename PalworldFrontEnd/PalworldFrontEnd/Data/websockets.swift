import Foundation

class WebSocketManager: ObservableObject {
    
    private var webSocketTask: URLSessionWebSocketTask?
    private var urlSession: URLSession
    
    @Published var message: String = ""
    @Published var postedMessage: String = ""
    
    init() {
        urlSession = URLSession(configuration: .default)
    }
    
    func connect(urlString: String) {
        guard let url = URL(string:"wss://luckyspalworldserver.com/ws/\(urlString)/") else { return }
        webSocketTask = urlSession.webSocketTask(with: url)
        webSocketTask?.resume()
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
                print("WebSocket receiving error: \(error)")
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
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("WebSocket connection opened.")
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("WebSocket connection closed: \(closeCode)")
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            print("WebSocket receiving error: \(error)")
        }
    }
    
}
