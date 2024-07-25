//
//  ServerCard.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/27/24.
//

import SwiftUI

struct ServerCard: View {
    var body: some View {
        ZStack{
            Rectangle()
                        .frame(width: 400.0, height: 500.0)
                        .foregroundColor(Color(red: 0.28627450980392155, green: 0.5568627450980392, blue: 0.7254901960784313))
                        .cornerRadius(31)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
                    
                        .overlay(alignment: .topLeading){
                            Text("Palworld Server")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .padding([.leading,.top],25)
                        }
                        .overlay(alignment: .center){
                            VStack {
                                Rectangle()
                                    .frame(width: 350, height: 300)
                                    .foregroundColor(.cyan)
                                    .cornerRadius(31)
                                    .padding(.top, 50)
                                
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

struct ServerCard_Previews: PreviewProvider {
    static var previews: some View{
        ServerCard()
            .previewLayout(.sizeThatFits)
    }
}

