struct CurrentRequest: APIRequest {
    typealias Response = CurrentWeatherModel

    var baseURL: String { "http://api.weatherapi.com/v1" }
    var path: String { "/current.json" }
    var queryParameters: [String: String]? { ["key": "", "q": "Omsk", "aqi": "no"] }
    var httpMethod: String { "GET" }
}
