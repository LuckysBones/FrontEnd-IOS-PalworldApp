//
//  SettingsPage.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/29/24.
//

import SwiftUI

struct SettingsPage: View {
    @State var titleString = "Settings"
    var body: some View {
        
        VStack(spacing:0.0){
            
            AltHeader(titleString: $titleString)
            Spacer()
            
        }
        .background(Color(red: 0.7450980392156863, green: 0.8705882352941177, blue: 0.9098039215686274))
    }
}

#Preview {
    SettingsPage()
}
