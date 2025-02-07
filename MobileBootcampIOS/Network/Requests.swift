struct CurrentRequest: APIRequest {
    typealias Response = ForecastWeatherModel

    private let city: String

    init(city: String) {
        self.city = city
    }

    var baseURL: String { "https://api.weatherapi.com" }
    var path: String { "/v1/forecast.json" }
    var queryParameters: [String: String]? { ["key": "", "q": city] }
    var httpMethod: String { "GET" }
}
