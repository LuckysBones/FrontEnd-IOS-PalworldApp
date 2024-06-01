//
//  Controls.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/30/24.
//

import SwiftUI

struct Controls: View {
    var body: some View {
        VStack(spacing:0.0){
            AltHeader()
            ScrollView{
                Info()
                    .padding(.top,40)
                Players()
                    .padding(.top, 10)
                Message()
                    .padding(.top, 10)
                HStack{
                    Save()
                        .padding()
                    Spacer()
                    Shutdown()
                        .padding()
                }
            }
        }.background(Color(red: 0.7450980392156863, green: 0.8705882352941177, blue: 0.9098039215686274))
    }
}

#Preview {
    Controls()
}
