import SwiftUI
import CoreLocation

protocol LocationManagerDelegate: AnyObject {
    func didUpdateLocation(city: String)
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    weak var delegate: LocationManagerDelegate?

    private var locationManager = CLLocationManager()
    @Published var city: String = "Unknown"

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        getCityName(from: location)
    }

    func getCityName(from location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first, let cityName = placemark.locality {
                DispatchQueue.main.async {
                    self.city = cityName
                }
            } else {
                DispatchQueue.main.async {
                    self.city = "Unknown"
                }
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.city = "Unknown"
        }
    }
}

extension LocationManager {
    private func updateCity(_ city: String) {
        self.city = city
        delegate?.didUpdateLocation(city: city)
    }
}
