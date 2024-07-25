//
//  Controls.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/30/24.
//

import SwiftUI

struct Controls: View {
    @State var titleString: String = "Palworld Server"
    var body: some View {
        NavigationStack{
            VStack(spacing:0.0){
                AltHeader(titleString: $titleString)
                ScrollView{
                    HStack{
                        Save()
                            .padding([.leading,.trailing],16)
                        Shutdown()
                            .padding([.leading,.trailing],16)
                    }
                    .padding([.top,.bottom],25)
                    Metrics()//Contains Both Metrics (FPS-#ofPlayers) and Info (Version)
                    Players()
                        .padding(.top, 10)
                    
                    Message()
                        .padding(.top, 10)
                }
            }.background(Color(red: 0.7450980392156863, green: 0.8705882352941177, blue: 0.9098039215686274))
        }
    }
}

#Preview {
    Controls()
}
