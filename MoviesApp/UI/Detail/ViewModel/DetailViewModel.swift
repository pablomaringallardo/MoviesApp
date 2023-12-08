//
//  DetailViewModel.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 24/11/23.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {
    @Published var status = Status.loading
    @Published var detailMovie: DetailMovie?
    @Published var actors: [CreditsModel]?
    
    var suscriptors = Set<AnyCancellable>()
    var interactor: DetailViewInteractorProtocol
    
    init(
        interactor: DetailViewInteractorProtocol = DetailViewInteractor(),
        testing: Bool = false
    ) {
        self.interactor = interactor
        if testing {
            getMovieTesting()
        }
    }
    
    func getDetailMovie(id: Int) {
        interactor.getDetailMovie(id: id)
            .sink { completion in
                switch completion {
                case .finished:
                    self.status = .loaded
                case .failure:
                    self.status = .error(error: "Error al traer el detalle de la película.")
                }
            } receiveValue: { response in
                self.detailMovie = response
            }
            .store(in: &suscriptors)
    }
    
    func getCreditsMovie(id: Int) {
        interactor.getCreditsMovie(id: id)
            .sink { completion in
                switch completion {
                case .finished:
                    self.status = .loaded
                case .failure:
                    self.status = .error(error: "Error al traer los actores.")
                    print("Error")
                }
            } receiveValue: { response in
                self.actors = response.cast
                print(response.cast)
            }
            .store(in: &suscriptors)
    }
    
    func getMovieTesting() {
        self.detailMovie = .previewDetail
    }
}
