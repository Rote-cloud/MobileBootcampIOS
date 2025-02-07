import Foundation
import SwiftUI

final class MainViewModel: ObservableObject {

    enum MainViewModelState: Equatable {
        case loaded
        case loading
        case error
    }

    private let router: MainPageRouter
    private let locationManager: LocationManager
    private var weatherManager: WeatherManagerProtocol

    @Published var weather: WeatherEntity = .stub
    @Published var state: MainViewModelState = .loading

    init(router: MainPageRouter) {
        self.router = router
        self.locationManager = LocationManager()
        self.weatherManager = WeatherManager()
        self.updateLocation()
    }

    func navigateToAddSityPage() {
        self.router.routeToAddSityPage()
    }

    func updateLocation() {
        locationManager.requestLocation { [weak self] city in
            guard let self = self else { return }
            self.weatherManager.city = city
            self.getWeatherForCity()
        }
    }

    func getWeatherForCity() {
        self.state = .loading
        weatherManager.fetchWeather { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    self?.weather = weather
                    self?.state = .loaded
                case .failure:
                    self?.state = .error
                }
            }
        }
    }
}

// MARK: - HomePageViewModel mock for preview

extension MainViewModel {
    static let mock: MainViewModel = .init(router: MainPageRouter.mock)
}
