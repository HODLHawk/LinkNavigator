import LinkNavigator
import SwiftUI

struct GameView: View {

  let navigator: SingleLinkNavigator
  let injectionData: GameInjectionData?

  var gameTitle: String {
    injectionData?.gameTitle ?? ""
  }

  var body: some View {
    VStack(spacing: 30) {
      PathIndicator(currentPath: navigator.getCurrentPaths().joined(separator: " -> "))
        .padding(.top, 32)

      Text("\(gameTitle) 게임")

      Spacer()

      Button(action: {
        navigator.back(isAnimated: true)
      }) {
        Text("게임 종료")
      }
    }
    .padding()
  }
}
