//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 21/11/23.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var status = Status.loading
    @Published var topRated: [MovieTopRated]?
    var suscriptors = Set<AnyCancellable>()
    var interactor: HomeViewInteractorProtocol
    
    init(interactor: HomeViewInteractorProtocol = HomeViewInteractor()) {
        self.interactor = interactor
        self.getTopRated()
    }
    
    func getTopRated() {
        interactor.getTopRated()
            .sink { completion in
                switch completion {
                case .failure:
                    self.status = .error(error: "Error al traer las películas top rated")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { response in
                self.topRated = response.results
            }
            .store(in: &suscriptors)

    }
}
