//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 21/11/23.
//

import Foundation

enum Enpoint: String {
    case topRated = "movie/top_rated"
}

enum HttpMethods: String {
    case get = "GET"
}

struct NetworkManager {
    
    func getSession(endpoint: String) -> URLRequest? {
        
        guard let url = URL(string: "\(baseURL)\(endpoint)") else { return nil }
        
        var request: URLRequest = URLRequest(url: url)
        
        request.httpMethod = HttpMethods.get.rawValue
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        return request
    }
}
