//
//  NetworkManager.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 23.05.2025.
//

import Foundation

class NetworkManager{
    //MARK: - Properties
    static let shared = NetworkManager()
    
    //MARK: - Init
    private init() {}
    
    //MARK: - Functions
    func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping(Result<T,NetworkError>) -> Void){
        let task = URLSession.shared.dataTask(with: endpoint.makeRequest()) { data, response, error in
          
            if let error = error {
                completion(.failure(.unknown(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.noData)) // veya .invalidURL kullanılabilir bağlama göre
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.serverError(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            print("📦 JSON:", String(data: data, encoding: .utf8) ?? "N/A")

            do{
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            }catch{
                print("❌ Decoding error:", error)
                completion(.failure(.decodingFailed))
            }
            
        }
        task.resume()
    }
    
}
