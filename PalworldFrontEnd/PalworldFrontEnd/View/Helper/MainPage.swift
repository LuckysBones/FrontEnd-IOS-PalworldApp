//
//  MainPage.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/27/24.
//

import SwiftUI

struct MainPage: View {
    
    var body: some View {

        NavigationSplitView{
            List{
                ServerCard()
            }
            .navigationTitle("Palworld Server's")
        } detail: {
            Text("Select Palworld Server")
        }
    }
}

#Preview{
    MainPage()
}
