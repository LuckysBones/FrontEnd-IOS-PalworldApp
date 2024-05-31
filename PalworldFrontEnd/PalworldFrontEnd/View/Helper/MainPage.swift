//
//  MainPage.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/27/24.
//

import SwiftUI

struct MainPage: View {
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0.0) {
                Header()
                    .shadow(radius: 5)
                
                ScrollView(.vertical, showsIndicators: false){
                    NavigationLink(destination: Controls()){
                        ServerCard()
                            .padding(.top, 80)
                            .shadow(radius: 5)
                    }
                    
                }
                
                
                
            }
            .background(Color(red: 0.7450980392156863, green: 0.8705882352941177, blue: 0.9098039215686274))
            
            
        }
    }
}

#Preview{
    MainPage()
}
