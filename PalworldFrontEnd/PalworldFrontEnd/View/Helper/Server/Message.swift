//
//  Message.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/31/24.
//

import SwiftUI

struct Message: View{
    @StateObject private var messageSocket = ParseJSON()
    @State private var inputMessage = ""
    
    var body: some View {
            ZStack {
                Rectangle()
                    .frame(width: 400 ,height: 150)
                    .cornerRadius(13.0)
                    .foregroundColor(Color(red: 0.28627450980392155, green: 0.5568627450980392, blue: 0.7254901960784313))
                
                    .overlay(alignment: .topLeading){
                        Text("Messsage")
                            .font(.title)
                            .bold()
                            .padding([.leading,.top],20)
                    }
                
                    .overlay(alignment: .center) {
                        
                        VStack {
                            Spacer()
                            Spacer()
                            Spacer()
                            TextField(
                                "Type Your Message Here",
                                text: $inputMessage
                            )
                            .textFieldStyle(.plain)
                            .frame(width: 300)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 1, height: 1)))
                            .accentColor(.white)
                            .foregroundColor(.white)

                            
                            Spacer()
                            

                            HStack(alignment: .lastTextBaseline) {
                                Spacer()
                                Button(action: {
                                    messageSocket.sendMessage(messageString: inputMessage)
                                    inputMessage = ""
                                }) {
                                    Text("Submit")
                                        .foregroundStyle(.white)
                                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 1)))
                                        .padding(.trailing,15)
                                }
                            }
                            
                            
                            Spacer()
                            
                        }.padding()
                        
                    }
            }
            .onAppear{
                messageSocket.connect(urlString: "message")
            }
            .onDisappear {
                messageSocket.disconnect()
            }
        }
}

#Preview {
    Message()
}
