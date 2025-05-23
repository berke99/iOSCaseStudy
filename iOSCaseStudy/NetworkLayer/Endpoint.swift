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

enum NetworkError: Error {
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
    // Yeni endpointler buraya eklenebilir
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
        }
    }

    var method: HTTPMethod {
        switch self {
        case .registerUser, .loginUser:
            return .post
        }
    }
    
    var headers: [String: String] {
        return [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
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

