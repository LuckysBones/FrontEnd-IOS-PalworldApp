//
//  MainPage.swift
//  PalworldFrontEnd
//
//  Created by Luc Gremillion on 5/27/24.
//

import SwiftUI
import SwiftData

struct MainPage: View {
    
    @ObservedObject var parseData: ParseJSON
    @State private var textString = ""
    //let serverMetrics:  ServerMetrics
    
    var body: some View {
        NavigationStack{
            
            VStack(spacing: 0.0) {
                Header()
                
                ScrollView(.vertical, showsIndicators: false){
                    
                    ServerCard(parseData: parseData)
                        .padding([.top,.bottom], 25)
                    
                    Metrics(parseData: parseData)
                        .padding(.bottom, 10)
                    
                    HStack{
                        Save()
                            .padding([.leading,.trailing],16)
                        Shutdown()
                            .padding([.leading,.trailing],16)
                    }
                    .padding(.top, 175)

                    Spacer(minLength: 50)
                    
                    Message()
                        .padding(.bottom, 50)
                    Players()
                        .padding(.bottom, 150)
                }
            }
            .background(Color(red: 0.7450980392156863, green: 0.8705882352941177, blue: 0.9098039215686274))
        }
        .accentColor(.white)
    }
}

#Preview{
    MainPage(parseData: ParseJSON())
}
