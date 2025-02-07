import Foundation

protocol WeatherManagerProtocol {
    var city: String? { get set }

    func fetchWeather(completion: @escaping (Result<WeatherEntity, Error>) -> Void)
}

final class WeatherManager: WeatherManagerProtocol {
    @Published var city: String?
    private let networkService: NetworkService = NetworkService()

    func fetchWeather(completion: @escaping (Result<WeatherEntity, Error>) -> Void) {
        guard let city = city else { return }
        let request = CurrentRequest(city: city)
        networkService.send(request) { (result: Result<ForecastWeatherModel, Error>) in
            switch result {
            case .success(let weatherModel):
                let result = self.map(weatherModel)
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension WeatherManager {
    private func map(_ model: ForecastWeatherModel) -> WeatherEntity {
        return WeatherEntity(
            location: mapLocation(model.location),
            current: mapCurrent(model.current, model.forecast),
            forecast: mapForecast(model.forecast)
        )
    }

    private func mapLocation(_ location: Location) -> LocationEntity {
        let date = DateFormatter.formatWeatherDate(location.localtimeEpoch)
        return LocationEntity(
            name: location.name,
            date: date
        )
    }

    private func mapCurrent(_ current: Current, _ forecast: Forecast) -> CurrentEntity {
        let today = forecast.forecastday.first?.day
        return CurrentEntity(
            temperature: "\(Int(current.tempC))°",
            condition: ConditionEntity(
                text: current.condition.text,
                iconUrl: URL(string: "https:\(current.condition.icon)")
            ),
            minMaxTemp: "\(Int(today?.mintempC ?? 0))°/\(Int(today?.maxtempC ?? 0))°",
            feelsLike: "Feels like \(Int(current.feelslikeC))°",
            additionalInfo: AdditionalInfoEntity(
                humidity: "\(current.humidity)%",
                pressure: "\(current.pressureMb) mb",
                windSpeed: "\(current.windKph) kph",
                windDirection: current.windDir,
                visibility: "\(current.visKm) km",
                uvIndex: String(format: "%.0f", current.uv)
            ),
            astronomyInfo: self.mapAstronomy(forecast.forecastday.first?.astro),
            precipitationInfo: self.mapPrecipitation(today)
        )
    }

    private func mapAstronomy(_ astro: Astro?) -> AstronomyInfoEntity {
        return AstronomyInfoEntity(
            sunrise: astro?.sunrise ?? "",
            sunset: astro?.sunset ?? "",
            moonrise: astro?.moonrise ?? "",
            moonset: astro?.moonset ?? ""
        )
    }

    private func mapPrecipitation(_ day: OneDay?) -> PrecipitationInfoEntity {
        return PrecipitationInfoEntity(
            isRaining: day?.dailyWillItRain == 1 ? "Yes" : "No",
            chanceOfRain: "\(day?.dailyChanceOfRain ?? 0)%",
            isSnowing: day?.dailyWillItSnow == 1 ? "Yes" : "No"
        )
    }

    private func mapForecast(_ forecast: Forecast) -> ForecastEntity {
        return ForecastEntity(
            daily: self.mapDailyForecast(forecast.forecastday)
        )
    }

    private func mapDailyForecast(_ days: [ForecastDay]) -> [DailyForecastEntity] {
        return days.map { day in
            DailyForecastEntity(
                condition: ConditionEntity(
                    text: day.day.condition.text,
                    iconUrl: URL(string: "https:\(day.day.condition.icon)")
                ),
                minMaxTemp: "\(Int(day.day.mintempC))°/\(Int(day.day.maxtempC))°"
            )
        }
    }
}
