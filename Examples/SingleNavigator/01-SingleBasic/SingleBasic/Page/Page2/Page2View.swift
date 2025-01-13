import LinkNavigator
import SwiftUI

struct Page2View: View {

  // MARK: Internal

  let navigator: SingleLinkNavigator

  var body: some View {
    VStack(spacing: 30) {
      PathIndicator(currentPath: paths.joined(separator: " -> "))
        .padding(.top, 32)

      Button(action: {
        navigator.next(linkItem: .init(path: "page3"), isAnimated: true)
      }) {
        Text("go to next Page")
      }

      Button(action: {
        navigator.rootNext(linkItem: .init(path: "page3"), isAnimated: true)
      }) {
        Text("**root** next")
      }

      Button(action: {
        navigator.remove(pathList: ["page1"])
        paths = navigator.getCurrentPaths()
      }) {
        Text("remove Page 1")
          .foregroundColor(.red)
      }

      Button(action: {
        navigator.back(isAnimated: true)
      }) {
        Text("back")
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
