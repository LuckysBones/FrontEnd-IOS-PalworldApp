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
    
    
    var body: some View {
        NavigationStack{
            VStack(spacing:0.0){
                AltHeader(titleString: $titleString)
                ScrollView{
                }
            }.background(Color(red: 0.7450980392156863, green: 0.8705882352941177, blue: 0.9098039215686274))
        }
        .onAppear{
            playerData.connect(urlString: "players")
            playerData.receive()
            playerData.isConnected = true
            Task {await playersBackground(parseData: playerData)}
        }
        .onDisappear{
            playerData.isConnected = false
        }
        .accentColor(.white)
    }
    
    /*func runButtonAction() {
        parseData.disconnect()
        parseData.connect(urlString: "players")
    }*/
}

func playersBackground(parseData: ParseJSON) async {
    
    await Task.detached(priority: .background) {
        while parseData.isNull() {
            parseData.receive()
            try? await Task.sleep(nanoseconds: 500_000_000) // .5 seconds
        }
        
        while parseData.isConnected {
            //parseData.printJson()
            parseData.parsePlayerData()
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
    Player(playerData: ParseJSON())
}
