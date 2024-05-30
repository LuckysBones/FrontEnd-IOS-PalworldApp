//
//  Header.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/29/24.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Palworld")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                .padding()
                Spacer()
                Image(systemName: "gear")
                    .foregroundColor(.white)
                    .padding(20.00)
            }
        }
        .frame(height: 100.0).background(Color(red: 0.7450980392156863, green: 0.8705882352941177, blue: 0.9098039215686274))
            
    }
}

#Preview {
    Header()
}
