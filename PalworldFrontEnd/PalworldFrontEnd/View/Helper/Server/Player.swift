//
//  Player.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 6/3/24.
//

import SwiftUI

struct Player: View {
    var body: some View {
        VStack{
            List{
                Rectangle()
                    .frame(width: 400 ,height: 85)
                    .cornerRadius(13.0)
                    .foregroundColor(Color(red: 0.28627450980392155, green: 0.5568627450980392, blue: 0.7254901960784313))
            }
            
        }
    }
}

#Preview {
    Player()
}
