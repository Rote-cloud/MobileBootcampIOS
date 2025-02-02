import Foundation

protocol APIRequest {
    associatedtype Response: Decodable
    var baseURL: String { get }
    var path: String { get }
    var queryParameters: [String: String]? { get }
    var httpMethod: String { get }
}

extension APIRequest {
    var url: URL? {
        var components = URLComponents(string: baseURL)
        components?.path = path
        if let queryParameters = queryParameters {
            components?.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        return components?.url
    }
}
