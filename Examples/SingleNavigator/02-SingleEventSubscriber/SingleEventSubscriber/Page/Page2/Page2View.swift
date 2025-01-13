import LinkNavigator
import SwiftUI

struct Page2View: View {

  // MARK: Lifecycle

  init(
    navigator: SingleLinkNavigator,
    linkSubscriber: Page2LinkSubscriber)
  {
    self.navigator = navigator
    self.linkSubscriber = linkSubscriber
  }

  // MARK: Internal

  var body: some View {
    VStack(spacing: 30) {
      PathIndicator(currentPath: navigator.getCurrentPaths().joined(separator: " -> "))
        .padding(.top, 32)

      Button(action: {
        navigator.backOrNext(linkItem: .init(path: "page3"), isAnimated: true)
      }) {
        Text("go to next Page")
      }

      GroupBox {
        VStack(spacing: 10) {
          HStack {
            Image(systemName: "envelope")
            Text("page3 event handler")
          }
          .font(.footnote)
          .foregroundColor(.secondary)

          Text(linkSubscriber.linkAction?.message ?? "-")
        }
      }

      Spacer()
    }
    .padding()
  }

  // MARK: Private

  private let navigator: SingleLinkNavigator
  @ObservedObject private var linkSubscriber: Page2LinkSubscriber

}
