import SwiftUI

struct Players: View {
    
    @StateObject var playerData = ParseJSON()
    
    var body: some View {
        NavigationStack {
            HStack {
                NavigationLink(destination: Player(playerData: playerData)) {
                    ZStack {
                        Rectangle()
                            .frame(width: 400, height: 85)
                            .cornerRadius(13.0)
                            .foregroundColor(Color(red: 0.286, green: 0.557, blue: 0.725))
                        Text("See Players Online")
                    }
                }
            }
        }
        .accentColor(.white)
    }
}

#Preview {
    Players()
}
