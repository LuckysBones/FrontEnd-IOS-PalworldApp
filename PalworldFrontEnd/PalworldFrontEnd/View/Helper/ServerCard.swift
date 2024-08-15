//
//  ServerCard.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/27/24.
//

import SwiftUI

struct ServerCard: View {
    
    @ObservedObject var parseData: ParseJSON
    
    var body: some View {
        ZStack{
            Rectangle()
                        .frame(width: 400.0, height: 420.0)
                        .foregroundColor(Color(red: 0.28627450980392155, green: 0.5568627450980392, blue: 0.7254901960784313))
                        .cornerRadius(13)
                        //.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
                    
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
                                    .cornerRadius(13)
                                    .padding(.top, 50)
                                
                            }
                        
                        }
        }
    }
}

struct ServerCard_Previews: PreviewProvider {
    static var previews: some View{
        ServerCard(parseData: ParseJSON())
            .previewLayout(.sizeThatFits)
    }
}

