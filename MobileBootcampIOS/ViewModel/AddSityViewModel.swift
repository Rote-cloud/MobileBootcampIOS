import Foundation

final class AddSityViewModel: ObservableObject {

    private let router: AddSityPageRouter

    init(router: AddSityPageRouter) {
        self.router = router
    }

    func navigateToMainPage() {
        self.router.routeToMainPage()
    }
}

// MARK: - HomePageViewModel mock for preview

extension AddSityViewModel {
    static let mock: AddSityViewModel = .init(router: AddSityPageRouter.mock)
}
