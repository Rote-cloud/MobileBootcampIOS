import SwiftUI

class MainPageRouter {

    private let rootCoordinator: NavigationCoordinator

    init(rootCoordinator: NavigationCoordinator) {
        self.rootCoordinator = rootCoordinator
    }

    func routeToAddSityPage() {
        let router = AddSityPageRouter(rootCoordinator: self.rootCoordinator)
        rootCoordinator.push(router)
    }
}

// MARK: - ViewFactory implementation

extension MainPageRouter: Routable {

    func makeView() -> AnyView {
        let viewModel = MainViewModel(router: self)
        let view = MainView(viewModel: viewModel)
        return AnyView(view)
    }
}

// MARK: - Hashable implementation

extension MainPageRouter {
    static func == (lhs: MainPageRouter, rhs: MainPageRouter) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
}

// MARK: - Router mock for preview

extension MainPageRouter {
    static let mock: MainPageRouter = .init(rootCoordinator: AppRouter())
}
