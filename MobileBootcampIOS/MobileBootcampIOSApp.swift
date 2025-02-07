import SwiftUI

@main
struct MobileBootcampIOSApp: App {
    var body: some Scene {
        WindowGroup {
            CustomNavigationView(appRouter: .init())
        }
    }
}
