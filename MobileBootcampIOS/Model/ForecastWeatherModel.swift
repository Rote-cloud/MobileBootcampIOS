import Foundation

struct ForecastWeatherModel: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
}

struct Forecast: Codable {
    let forecastday: [ForecastDay]
}

struct ForecastDay: Codable {
    let date: String
    let date_epoch: Int
    let day: Day
    let astro: Astro
    let hour: [Hour]
}

struct Day: Codable {
    let maxtemp_c: Double
    let maxtemp_f: Double
    let mintemp_c: Double
    let mintemp_f: Double
    let avgtemp_c: Double
    let avgtemp_f: Double
    let maxwind_mph: Double
    let maxwind_kph: Double
    let totalprecip_mm: Double
    let totalprecip_in: Double
    let avgvis_km: Double
    let avgvis_miles: Double
    let avghumidity: Double
    let daily_will_it_rain: Int
    let daily_chance_of_rain: Int
    let daily_will_it_snow: Int
    let daily_chance_of_snow: Int
    let condition: Condition
    let uv: Double
}

struct Astro: Codable {
    let sunrise: String
    let sunset: String
    let moonrise: String
    let moonset: String
    let moon_phase: String
    let moon_illumination: String
}

struct Hour: Codable {
    let time_epoch: Int
    let time: String
    let temp_c: Double
    let temp_f: Double
    let is_day: Int
    let condition: Condition
    let wind_mph: Double
    let wind_kph: Double
    let wind_degree: Int
    let wind_dir: String
    let pressure_mb: Double
    let pressure_in: Double
    let precip_mm: Double
    let precip_in: Double
    let humidity: Int
    let cloud: Int
    let feelslike_c: Double
    let feelslike_f: Double
    let windchill_c: Double
    let windchill_f: Double
    let heatindex_c: Double
    let heatindex_f: Double
    let dewpoint_c: Double
    let dewpoint_f: Double
    let will_it_rain: Int
    let chance_of_rain: Int
    let will_it_snow: Int
    let chance_of_snow: Int
    let vis_km: Double
    let vis_miles: Double
    let gust_mph: Double
    let gust_kph: Double
    let uv: Double
}
