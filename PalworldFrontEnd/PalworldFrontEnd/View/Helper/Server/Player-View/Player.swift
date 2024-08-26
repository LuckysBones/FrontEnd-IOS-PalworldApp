//
//  Controls.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/30/24.
//

import SwiftUI

struct Player: View {
    
    
    @ObservedObject var playerData = ParseJSON()
    @State var titleString: String = "Palworld Server"
    
    @State var players: PlayersResponse?
    
    var body: some View {
        NavigationStack {
               AltHeader(titleString: $titleString)
               VStack(spacing: 0.0) {
                   if let players = playerData.returnPlayers()?.players, !players.isEmpty{
                       List(players) { player in
                           PlayerRow(player: player)
                       }
                   } else {
                       VStack{
                           Text("Not Here Yet")
                               .font(.headline)
                               .padding()
                       }
                   }
               }
        }
        .onAppear{
            //playerData.isConnected = true
            Task {await playersBackground(parseData: playerData)}
        }
        .onDisappear{
            //playerData.disconnect()
            playerData.isConnected = false
        }
        .accentColor(.white)
    }
    
    func playersBackground(parseData: ParseJSON) async {
        
        await Task.detached(priority: .background) {
            
            parseData.reset()
            
            while parseData.isConnected == false {
                parseData.connect(urlString: "players")
                parseData.checkConnection()
            }
            print("Connected - Players")
            
            while parseData.isNull() {
                parseData.receive()
                try? await Task.sleep(nanoseconds: 100_000_000) // .1 seconds
            }
            
            repeat {
                parseData.parsePlayerData()
                
                for _ in 1...5{
                    try? await Task.sleep(nanoseconds: 2_000_000_000) // 2 second * 5 loops = 10ish seconds
                    
                    if(parseData.isConnected == false){
                        break
                    }
                }
                
                if(parseData.isConnected == true){
                    parseData.receive()
                }
                
            } while parseData.isConnected == true
            
            parseData.disconnect()
            print("Disonnected - Players")
        }.value
    }}



#Preview {
    Player(playerData: ParseJSON())
}
