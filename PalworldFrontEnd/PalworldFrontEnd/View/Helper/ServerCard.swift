//
//  ServerCard.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/27/24.
//

import SwiftUI

struct ServerCard: View {
    var body: some View {
        HStack{
            
            VStack(alignment: .leading) {
                Text("Palworld Server")
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 5.0)
                Text("Current Players: ")
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 5.0)
                Text("Version: ")
                    .multilineTextAlignment(.leading)
            }
            .padding(.leading, -5.0)
            VStack(alignment: .trailing) {
                Text("Time Online: ")
                    .multilineTextAlignment(.trailing)
                    .padding(.bottom, 5.0)
                Text("Server Frame Time:")
                    .multilineTextAlignment(.trailing)
                    .padding(.bottom, 5.0)
                Text("Server FPS:")
                
            }
            .padding()
        }

    }
}

#Preview {
    ServerCard()
}
