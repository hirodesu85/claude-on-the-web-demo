import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "wand.and.stars")
                .imageScale(.large)
                .font(.system(size: 60))
                .foregroundStyle(.purple)

            Text("Claude on the Web")
                .font(.largeTitle)
                .bold()

            Text("iPhoneで動いています 🎉")
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
