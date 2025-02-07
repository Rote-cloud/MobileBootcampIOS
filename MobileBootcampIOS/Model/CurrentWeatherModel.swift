import Foundation

struct CurrentWeatherModel: Codable {
    let current: Current
    let location: Location

    static var stub: CurrentWeatherModel {
        .init(current: .stub, location: .stub)
    }
}

struct Location: Codable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tzId: String
    let localtimeEpoch: Int
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzId = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }

    static var stub: Location {
        .init(name: "", region: "", country: "", lat: 0, lon: 0, tzId: "", localtimeEpoch: 0, localtime: "")
    }
}

struct Current: Codable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Double
    let tempF: Double
    let isDay: Int
    let condition: Condition
    let windMph: Double
    let windKph: Double
    let windDegree: Int
    let windDir: String
    let pressureMb: Double
    let pressureIn: Double
    let precipMm: Double
    let precipIn: Double
    let humidity: Int
    let cloud: Int
    let feelslikeC: Double
    let feelslikeF: Double
    let windchillC: Double
    let windchillF: Double
    let heatindexC: Double
    let heatindexF: Double
    let dewpointC: Double
    let dewpointF: Double
    let visKm: Double
    let visMiles: Double
    let uv: Double
    let gustMph: Double
    let gustKph: Double

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case visKm = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }

    static var stub: Current {
        .init(
            lastUpdatedEpoch: 0, lastUpdated: "", tempC: 0,
            tempF: 0, isDay: 1, condition: .stub, windMph: 0,
            windKph: 0, windDegree: 0, windDir: "", pressureMb: 0,
            pressureIn: 0, precipMm: 0, precipIn: 0, humidity: 0,
            cloud: 0, feelslikeC: 0, feelslikeF: 0, windchillC: 0,
            windchillF: 0, heatindexC: 0, heatindexF: 0, dewpointC: 0,
            dewpointF: 0, visKm: 0, visMiles: 0, uv: 0, gustMph: 0, gustKph: 0
        )
    }
}

struct Condition: Codable {
    let text: String
    let icon: String
    let code: Int

    static var stub: Condition {
        .init(text: "", icon: "", code: 0)
    }
}
