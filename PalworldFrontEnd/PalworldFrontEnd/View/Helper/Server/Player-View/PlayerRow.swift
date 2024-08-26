//
//  PlayerRow.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 8/17/24.
//

import SwiftUI

struct PlayerRow: View {
    var player: PlayerServer? // The PlayerServer object

    var body: some View {
        HStack{
            Spacer()
            if let player = player {
                VStack(alignment: .leading) {
                    Text(player.name)
                        .font(.headline)
                    Text("Account: \(player.accountName)")
                        .font(.subheadline)
                    Text("Level: \(player.level)")
                        .font(.subheadline)
                    Text("Ping: \(player.ping) ms")
                        .font(.subheadline)
                }
                .background(.blue)
                .padding()
            } else {
                Text("No player data available")
                    .font(.headline)
                    .padding()
            }
            Spacer()
        }
        .background(Color(red: 0.7450980392156863, green: 0.8705882352941177, blue: 0.9098039215686274))
    }
}

#Preview {
    // Provide an instance of PlayerServer for the preview
    PlayerRow(player: PlayerServer(
        name: "Test Player",
        accountName: "TestAccount",
        playerId: "player123",
        userId: "user123",
        //ip: "192.168.1.1",
        ping: 20.5,
        locationX: 100.0,
        locationY: 200.0,
        level: 5
    ))
}
