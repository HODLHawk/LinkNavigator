import LinkNavigator
import SwiftUI

struct Page4View: View {

  // MARK: Internal

  let navigator: SingleLinkNavigator

  var body: some View {
    VStack(spacing: 30) {
      PathIndicator(currentPath: paths.joined(separator: " -> "))
        .padding(.top, 32)

      Button(action: {
        navigator.backOrNext(linkItem: .init(path: "home"), isAnimated: true)
      }) {
        Text("back to Home")
      }

      Button(action: {
        navigator.back(isAnimated: true)
      }) {
        Text("back")
      }

      Button(action: {
        navigator.replace(linkItem: .init(path: "home"), isAnimated: false)
      }) {
        Text("reset")
          .foregroundColor(.red)
      }

      Spacer()
    }
    .padding()
    .onAppear {
      paths = navigator.getCurrentPaths()
    }
  }

  // MARK: Private

  @State private var paths: [String] = []

}
