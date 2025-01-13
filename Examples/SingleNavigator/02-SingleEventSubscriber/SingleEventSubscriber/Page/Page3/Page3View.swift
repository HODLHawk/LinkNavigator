import LinkNavigator
import SwiftUI

// MARK: - Page3View

struct Page3View: View {

  let navigator: SingleLinkNavigator
  @State var message = ""

  var body: some View {
    VStack(spacing: 30) {
      PathIndicator(currentPath: navigator.getCurrentPaths().joined(separator: " -> "))
        .padding(.top, 32)

      VStack(spacing: 16) {
        TextField("Type message here", text: $message)
          .textFieldStyle(.roundedBorder)
          .padding(.horizontal)

        Button(action: {
          navigator.rootSend(
            item: .init(
              path: "page2",
              items: Page2InjectionData(message: message)))
          navigator.back(isAnimated: true)

        }) {
          Text("back with Message")
        }
      }

      Spacer()
    }
    .padding()
  }
}

// MARK: Page3View.Page2InjectionData

extension Page3View {
  struct Page2InjectionData: Equatable, Codable {
    let message: String
  }
}
