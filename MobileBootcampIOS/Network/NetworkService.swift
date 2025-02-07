import Foundation

protocol NetworkServiceProtocol {
    func send<T: APIRequest>(_ request: T, completion: @escaping (Result<T.Response, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {

    func send<T: APIRequest>(_ request: T, completion: @escaping (Result<T.Response, Error>) -> Void) {
        guard let url = request.url else {
            completion(.failure(URLError(.badURL)))
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod

        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(URLError(.badServerResponse)))
                }
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(T.Response.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedResponse))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
