//
//  PickerViewInteractor.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 4/12/23.
//

import Foundation
import Combine

protocol PickerViewInteractorProtocol: AnyObject {
    func getMoviesPicker(endpoint: EndpointPicker) -> AnyPublisher<MoviesHomePickerResponse, Error>
}

final class PickerViewInteractor: PickerViewInteractorProtocol {
    
    let networker: NetworkerProtocol
    let networkManager: NetworkManager
    
    init(networker: NetworkerProtocol = Networker(), networkManager: NetworkManager = NetworkManager()) {
        self.networker = networker
        self.networkManager = networkManager
    }
    
    func getMoviesPicker(endpoint: EndpointPicker) -> AnyPublisher<MoviesHomePickerResponse, Error> {
        return networker.callServer(type: MoviesHomePickerResponse.self, request: networkManager.getSession(endpoint: endpoint.rawValue)!)
    }
    
}
