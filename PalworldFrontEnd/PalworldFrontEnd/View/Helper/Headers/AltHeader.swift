//
//  AltHeader.swiftsd
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/31/24.
//

import SwiftUI

struct AltHeader: View {
    @Binding var titleString: String
    var body: some View {
            VStack{
                HStack{
                    Spacer()
                    Text("\(titleString)")
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding()
                    

                }.frame(height: 60.0).background(Color(red: 0.28627450980392155, green: 0.5568627450980392, blue: 0.7254901960784313))
            }
    }
}

struct AltHeader_Previews: PreviewProvider {
    @State static var previewTitle = "Sample Title"
    
    static var previews: some View {
        AltHeader(titleString: $previewTitle)
    }
}
