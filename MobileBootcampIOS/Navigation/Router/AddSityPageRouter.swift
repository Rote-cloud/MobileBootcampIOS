import SwiftUI

class AddSityPageRouter {

    private let rootCoordinator: NavigationCoordinator

    init(rootCoordinator: NavigationCoordinator) {
        self.rootCoordinator = rootCoordinator
    }

    func routeToMainPage() {
        rootCoordinator.popToRoot()
    }
}

// MARK: - ViewFactory implementation

extension AddSityPageRouter: Routable {

    func makeView() -> AnyView {
        let viewModel = AddSityViewModel(router: self)
        let view = AddSityView(viewModel: viewModel)
        return AnyView(view)
    }
}

// MARK: - Hashable implementation

extension AddSityPageRouter {
    static func == (lhs: AddSityPageRouter, rhs: AddSityPageRouter) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
}

// MARK: - Router mock for preview

extension AddSityPageRouter {
    static let mock: AddSityPageRouter = .init(rootCoordinator: AppRouter())
}
