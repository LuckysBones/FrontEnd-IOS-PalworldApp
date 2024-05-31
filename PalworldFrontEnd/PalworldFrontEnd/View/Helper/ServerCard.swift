//
//  ServerCard.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/27/24.
//

import SwiftUI

struct ServerCard: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 400.0, height: 500.0)
                    .foregroundColor(Color(red: 0.28627450980392155, green: 0.5568627450980392, blue: 0.7254901960784313))
                    .cornerRadius(31)
                
                VStack{
                    HStack(spacing: 0.0) {
                        Text("Palworld Server")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .padding(.leading, -128)
                    }
                    Rectangle()
                        .frame(width: 350, height: 300)
                        .foregroundColor(.cyan)
                        .cornerRadius(31)
                    HStack{
                        VStack(alignment: .leading) {
                            Text("Current Players: ")
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.white)
                            Text("Version: ")
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.white)
                        }
                        .padding()
                        VStack(alignment: .trailing) {
                            Text("Time Online: ")
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.trailing)
                            Text("Server Frame Time:")
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.trailing)
                            
                            Text("Server FPS:")
                                .foregroundColor(Color.white)
                            
                        }
                        .padding()
                    }
                    
                }
            }

        }
        

    }
}

#Preview {
    ServerCard()
}
