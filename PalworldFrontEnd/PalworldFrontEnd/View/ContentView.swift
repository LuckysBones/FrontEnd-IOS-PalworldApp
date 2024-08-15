//
//  ContentView.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/15/24.
//
import SwiftUI

struct ContentView: View {
    @StateObject var parseData = ParseJSON()
    @State var isConnected: Bool = true
    
    var body: some View {
        VStack {
            MainPage(parseData: parseData)
        }
        .background(Color(red: 0.286, green: 0.556, blue: 0.725)) // Simplified color values
        .onAppear {
            parseData.connect(urlString: "metric")
        }
    }
}
#Preview {
    ContentView()
}
