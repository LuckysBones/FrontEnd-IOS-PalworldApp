//
//  HeaderImage.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/27/24.
//

import SwiftUI

struct HeaderImage: View {
    var image: Image
    var body: some View {
        VStack{
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, -500.0)
            Text("Palworld App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0, opacity: 1.0))
                .multilineTextAlignment(.center)
                .lineLimit(12)
                .padding(.top, -340.0)




        }
    }
}

#Preview {
    HeaderImage(image: Image("palimage"))
}
