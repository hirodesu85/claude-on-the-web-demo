import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "iphone")
                .font(.system(size: 60))
                .foregroundStyle(.tint)
            Text("Hello, World!")
                .font(.largeTitle)
                .bold()
            Text("スマホだけで作ったiOSアプリ")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
