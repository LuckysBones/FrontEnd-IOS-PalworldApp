//
//  Data.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 6/3/24.
//

import Foundation
import SwiftData



struct PlayerServer: Codable {
    
    let name: String
    let accountName: String
    let playerId: String
    let userId: String
    let ip: String
    let ping: Double
    let locationX: Double
    let locationY: Double
    let level: Int

    enum CodingKeys: String, CodingKey {
        case name
        case accountName
        case playerId
        case userId
        case ip
        case ping
        case locationX = "location_x"
        case locationY = "location_y"
        case level
    }
}

// Define a struct for the response
struct PlayersResponse: Codable {
    let players: [PlayerServer]
}


struct ServerMetrics : Decodable {
    var currentplayernum: Int
    var serverfps: Int
    var serverframetime: Double
    var maxplayernum: Int
    var uptime: Int
}



/** init (currentPlayerNum: Int, serverFps: Int, serverUptime: Int, maxPlayerNum: Int, serverFrameTime: Double) {
    self.currentPlayerNum = currentPlayerNum
    self.serverFps = serverFps
    self.serverUptime = serverUptime
    self.maxPlayerNum = maxPlayerNum
    self.serverFrameTime = serverFrameTime
}
**/
