//
//  Shutdown.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/31/24.
//

import SwiftUI

struct Shutdown: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 180 ,height: 100)
                .cornerRadius(13.0)
            .foregroundColor(Color(red: 0.28627450980392155, green: 0.5568627450980392, blue: 0.7254901960784313))
            
            .overlay(alignment: .center){
                VStack{
                    HStack {
                        Spacer()
                        Text("Power")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                        Spacer()
                        Image(systemName: "power")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                            .bold()
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    Shutdown()
}
