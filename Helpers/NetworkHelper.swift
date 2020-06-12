//
//  NetworkHelper.swift
//  Placezz
//
//  Created by Russell Archer on 11/06/2020.
//  Copyright © 2020 Russell Archer. All rights reserved.
//

import Foundation

class NetworkHelper {
    
    static let shared   = NetworkHelper()
    private let baseURL = "http://localhost:8080/api/"
    
    private init() {}
    
    func getAllPlaces(completed: @escaping (Result<[Place], PError>) -> Void) {
        let endpoint = baseURL + "places/"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.badUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let places = try decoder.decode([Place].self, from: data)
                completed(.success(places))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
