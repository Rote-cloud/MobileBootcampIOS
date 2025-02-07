import Foundation

struct WeatherEntity {
    let location: LocationEntity
    let current: CurrentEntity
    let forecast: ForecastEntity
}

struct LocationEntity {
    let name: String
    let date: String
}

struct CurrentEntity {
    let temperature: String
    let condition: ConditionEntity
    let minMaxTemp: String
    let feelsLike: String
    let additionalInfo: AdditionalInfoEntity
    let astronomyInfo: AstronomyInfoEntity
    let precipitationInfo: PrecipitationInfoEntity
}

struct ConditionEntity {
    let text: String
    let iconUrl: URL?
}

struct AdditionalInfoEntity {
    let humidity: String
    let pressure: String
    let windSpeed: String
    let windDirection: String
    let visibility: String
    let uvIndex: String
}

struct AstronomyInfoEntity {
    let sunrise: String
    let sunset: String
    let moonrise: String
    let moonset: String
}

struct PrecipitationInfoEntity {
    let isRaining: String
    let chanceOfRain: String
    let isSnowing: String
}

struct ForecastEntity {
    let daily: [DailyForecastEntity]
}

struct DailyForecastEntity {
    let condition: ConditionEntity
    let minMaxTemp: String
}

extension WeatherEntity {
    static var stub: WeatherEntity {
        WeatherEntity(
            location: .stub,
            current: .stub,
            forecast: .stub
        )
    }
}

extension LocationEntity {
    static var stub: LocationEntity {
        LocationEntity(
            name: "London",
            date: "Thu, 18 February"
        )
    }
}

extension CurrentEntity {
    static var stub: CurrentEntity {
        CurrentEntity(
            temperature: "9°",
            condition: .stub,
            minMaxTemp: "6°/10°",
            feelsLike: "Feels like 5°",
            additionalInfo: .stub,
            astronomyInfo: .stub,
            precipitationInfo: .stub
        )
    }
}

extension ConditionEntity {
    static var stub: ConditionEntity {
        ConditionEntity(
            text: "Partly cloudy",
            iconUrl: URL(string: "https://cdn.weatherapi.com/weather/64x64/day/116.png")
        )
    }
}

extension AdditionalInfoEntity {
    static var stub: AdditionalInfoEntity {
        AdditionalInfoEntity(
            humidity: "71%",
            pressure: "1001.0 mb",
            windSpeed: "29.9 kph",
            windDirection: "W",
            visibility: "10.0 km",
            uvIndex: "2"
        )
    }
}

extension AstronomyInfoEntity {
    static var stub: AstronomyInfoEntity {
        AstronomyInfoEntity(
            sunrise: "07:08 AM",
            sunset: "05:22 PM",
            moonrise: "09:49 AM",
            moonset: "No moonset"
        )
    }
}

extension PrecipitationInfoEntity {
    static var stub: PrecipitationInfoEntity {
        PrecipitationInfoEntity(
            isRaining: "Yes",
            chanceOfRain: "73%",
            isSnowing: "No"
        )
    }
}

extension ForecastEntity {
    static var stub: ForecastEntity {
        ForecastEntity(
            daily: [
                DailyForecastEntity(
                    condition: ConditionEntity(
                        text: "Patchy rain possible",
                        iconUrl: URL(string: "https://cdn.weatherapi.com/weather/64x64/day/176.png")
                    ),
                    minMaxTemp: "6°/10°"
                ),
                DailyForecastEntity(
                    condition: ConditionEntity(
                        text: "Overcast",
                        iconUrl: URL(string: "https://cdn.weatherapi.com/weather/64x64/day/122.png")
                    ),
                    minMaxTemp: "1°/8°"
                ),
                DailyForecastEntity(
                    condition: ConditionEntity(
                        text: "Patchy rain possible",
                        iconUrl: URL(string: "https://cdn.weatherapi.com/weather/64x64/day/176.png")
                    ),
                    minMaxTemp: "8°/12°"
                )
            ]
        )
    }
}
