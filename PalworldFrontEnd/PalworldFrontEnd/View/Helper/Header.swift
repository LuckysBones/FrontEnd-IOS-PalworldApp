//
//  Header.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/29/24.
//

import SwiftUI

struct Header: View {
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("PalApp")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding()
                    Spacer()
                    
                    NavigationLink(destination: SettingsPage()){
                        Image(systemName: "gear")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .padding(36)
                    }
                }.frame(height: 100.0).background(Color(red: 0.28627450980392155, green: 0.5568627450980392, blue: 0.7254901960784313))
            }
        }
    }
}

#Preview {
    Header()
}
