//
//  Endpoint.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 23.05.2025.
//

import Foundation

// MARK: - HTTP Method Enum

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}

// MARK: - Network Error Enum

enum NetworkError: Error{
    case invalidURL
    case decodingFailed
    case serverError(statusCode: Int)
    case noData
    case unknown(Error)
}

// MARK: - Endpoint Protocol

protocol EndpointProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var parameters: [String: Any]? { get }
    var queryItems: [URLQueryItem]? { get }
    
    func makeRequest() -> URLRequest
}

// MARK: - Endpoint Enum

enum Endpoint {
    case registerUser(name: String, surname: String, email: String, password: String)
    case loginUser(email: String, password: String)
    case currentUser(token: String)
    case movie
    case likeMovie(id: String, token: String)
    case unLikeMovie(id: String, token: String)
}

// MARK: - EndpointProtocol Conformance

extension Endpoint: EndpointProtocol {
    
    var baseUrl: String {
        return "https://moviatask.cerasus.app"
    }

    var path: String {
        switch self {
        case .registerUser:
            return "/api/auth/register"
        case .loginUser:
            return "/api/auth/login"
        case .currentUser:
            return "/api/auth/me"
        case .movie:
            return "/api/movies"
        case .likeMovie(let id, _):
            return "/api/movies/like/\(id)"
        case .unLikeMovie(let id, _):
            return "/api/movies/unlike/\(id)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .registerUser, .loginUser, .likeMovie, .unLikeMovie:
            return .post
        case .currentUser, .movie:
            return .get
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .currentUser(let token), .likeMovie(_, let token), .unLikeMovie(_, let token):
            return [
                "Authorization": "Bearer \(token)",
                "Accept": "application/json"
            ]
        default:
            return [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case let .registerUser(name, surname, email, password):
            return [
                "name": name,
                "surname": surname,
                "email": email,
                "password": password
            ]
        case let .loginUser(email, password):
            return [
                "email": email,
                "password": password
            ]
        case .currentUser(token: let token):
            return nil
        case .movie, .likeMovie, .unLikeMovie:
            return nil
        }
    }
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
    func makeRequest() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        if let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                fatalError("Encoding parameters failed: \(error)")
            }
        }

        return request
    }
}

