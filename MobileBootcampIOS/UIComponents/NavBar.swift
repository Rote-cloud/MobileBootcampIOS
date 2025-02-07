import SwiftUI

public struct NavBar<Left, Center, Right>: View where Left: View, Center: View, Right: View {
    let left: () -> Left
    let center: () -> Center
    let right: () -> Right

    public init(
        @ViewBuilder left: @escaping () -> Left = { EmptyView() },
        @ViewBuilder center: @escaping () -> Center = { EmptyView() },
        @ViewBuilder right: @escaping () -> Right = { EmptyView() }
    ) {
        self.left = left
        self.center = center
        self.right = right
    }
    public var body: some View {
        HStack {}
            .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                left()
            }
            ToolbarItem(placement: .principal) {
                center()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                right()
            }
        }
        .toolbarBackground(Colors.blue, for: .navigationBar, .navigationBar)
        .navigationBarBackButtonHidden(true)
        .toolbarRole(.navigationStack)
    }
}
