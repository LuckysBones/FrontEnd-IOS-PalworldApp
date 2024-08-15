//
//  Save.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/31/24.
//

import SwiftUI

struct Save: View {
    @StateObject private var saveSocket = ParseJSON()
    
    var body: some View {
        ZStack {
            Button(action:{
                saveSocket.receive()
            }){
                Rectangle()
                    .frame(width: 180 ,height: 100)
                    .cornerRadius(13.0)
                .foregroundColor(Color(red: 0.28627450980392155, green: 0.5568627450980392, blue: 0.7254901960784313))
                
                .overlay(alignment: .center){
                    VStack{
                        HStack {
                            Spacer()
                            Text("Save")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                            
                            Spacer()
                            
                            Image(systemName: "square.and.arrow.down")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35)
                                .padding(.bottom,16)
                                .bold()
                            Spacer()
                        }
                    }
                }
            }
        }
        .accentColor(.white)
        .onAppear(){
            saveSocket.connect(urlString: "save")
        }
        .onDisappear(){
            saveSocket.disconnect()
        }
    }
}

#Preview {
    Save()
}
