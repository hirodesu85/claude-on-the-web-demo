import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "iphone")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello from Claude on the Web!")
                .font(.headline)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
