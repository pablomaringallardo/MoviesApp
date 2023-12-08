//
//  DetailViewInteractor.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 24/11/23.
//

import Foundation
import Combine

protocol DetailViewInteractorProtocol: AnyObject {
    func getDetailMovie(id: Int) -> AnyPublisher<DetailMovie, Error>
    func getCreditsMovie(id: Int) -> AnyPublisher<Response, Error>
}

final class DetailViewInteractor: DetailViewInteractorProtocol {
    
    let networker: NetworkerProtocol
    let networkManager: NetworkManager
    
    init(networker: NetworkerProtocol = Networker(), networkManager: NetworkManager = NetworkManager()) {
        self.networker = networker
        self.networkManager = networkManager
    }
    
    func getDetailMovie(id: Int) -> AnyPublisher<DetailMovie, Error> {
        
        let endpoint = "movie/\(id)"
        
        return networker.callServer(type: DetailMovie.self, request: networkManager.getSession(endpoint: endpoint)!)
    }
    
    func getCreditsMovie(id: Int) -> AnyPublisher<Response, Error> {
        
        let endpoint = "movie/\(id)/credits"
        
        return networker.callServer(type: Response.self, request: networkManager.getSession(endpoint: endpoint)!)
    }
}
