//
//  MainPage.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/27/24.
//

import SwiftUI

struct MainPage: View {
    
    var body: some View {
        VStack(spacing: 0.0) {
            Header()
            ServerCard()
        }
        .background(Color(red: 0.28627450980392155, green: 0.5568627450980392, blue: 0.7254901960784313))

              
    }
}

#Preview{
    MainPage()
}
