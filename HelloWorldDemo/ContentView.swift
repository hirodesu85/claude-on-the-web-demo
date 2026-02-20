import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, World!")
                .font(.largeTitle)
                .bold()
            Text("Built with Claude Code on the Web")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("スマホ一台でiOSアプリ開発を検証中")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
