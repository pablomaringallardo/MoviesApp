//
//  HomeViewInteractor.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 22/11/23.
//

import Foundation
import Combine

protocol HomeViewInteractorProtocol: AnyObject {
    func getTopRated() -> AnyPublisher<TopRatedResponseModel, Error>
}

final class HomeViewInteractor: HomeViewInteractorProtocol {
    
    let networker: NetworkerProtocol
    let networkManager: NetworkManager
    
    init(networker: NetworkerProtocol = Networker(), networkManager: NetworkManager = NetworkManager()) {
        self.networker = networker
        self.networkManager = networkManager
    }
    
    func getTopRated() -> AnyPublisher<TopRatedResponseModel, Error> {
        
        let endpoint = "movie/top_rated"
        
        return networker.callServer(type: TopRatedResponseModel.self, request: networkManager.getSession(endpoint: endpoint)!)
    }
    
}
