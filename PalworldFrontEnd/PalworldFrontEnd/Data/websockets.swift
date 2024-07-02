//
//  websockets.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 7/1/24.
//
import Foundation
import UIKit

class PalworldSockets: NSObject, URLSessionWebSocketDelegate {
    
    
    private var webSocket: URLSessionWebSocketTask?
    
    func loadSocket(){
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        
        let url = URL(string: "ws://localhost:8000/ws/players/")
        
        webSocket = session.webSocketTask(with: url!)
        
        webSocket?.resume()
    }
    
    func receive(){
        
    }
    
    func send(){
        
    }
    
    @objc func closeSession(){
        
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("WebSocket Connected")
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("Disconnect from Server")
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didReceive message: Data) {
    }
}

