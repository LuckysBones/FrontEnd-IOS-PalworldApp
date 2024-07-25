//
//  Metrics.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/31/24.
//

import SwiftUI

struct Metrics: View {
    @State private var serverFPS = 0
    @State private var serverPlayer = 0
    @State private var serverTime = 0.0
    @State private var serverMax = 0
    @State private var serverUpTime = 0
    @State private var serverVersion = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 400 ,height: 150)
                .cornerRadius(13.0)
                .foregroundColor(Color(red: 0.28627450980392155, green: 0.5568627450980392, blue: 0.7254901960784313))
            
                .overlay(alignment: .topLeading){
                    Text("Metrics")
                        .font(.title)
                        .bold()
                        .padding([.leading,.top],20)
                }
            
            HStack(alignment: .lastTextBaseline){
                VStack(alignment: .leading,spacing: 20) {

                    Text("Version: \(serverVersion)")
                }
                Spacer()
                VStack(alignment: .trailing,spacing: 20) {
                    Text("Time (ms): \(serverTime)")
                    Text("FPS: \(serverFPS)")
                    Text("Uptime: \(serverUpTime)")
                    
                }
                
                
            }.padding([.leading,.trailing],22)
                .frame(width: 400,height: 150)
            
            
            
        }
    }
}

#Preview {
    Metrics()
}
