//
//  ServerCard.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/27/24.
//

import SwiftUI

struct ServerCard: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 400.0, height: 200.0)
                        .foregroundColor(Color(red: 0.7450980392156863, green: 0.8705882352941177, blue: 0.9098039215686274))
                        .cornerRadius(25)
                    
                    HStack{
                        
                        VStack(alignment: .leading) {
                            Text("Palworld Server Name")
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 20.0)
                            Text("Current Players: ")
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 20.0)
                            Text("Version: ")
                                .multilineTextAlignment(.leading)
                        }
                        .padding(.leading, -5.0)
                        VStack(alignment: .trailing) {
                            Text("Time Online: ")
                                .multilineTextAlignment(.trailing)
                                .padding(.bottom, 20.0)
                            Text("Server Frame Time:")
                                .multilineTextAlignment(.trailing)
                                .padding(.bottom, 20.0)
                            Text("Server FPS:")
                            
                        }
                        .padding()
                    }
                }

            }
            .padding(25.0)
        }
        

    }
}

#Preview {
    ServerCard()
}
