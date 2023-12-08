//
//  PickerViewModel.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 4/12/23.
//

import Foundation
import Combine

final class PickerViewModel: ObservableObject {
    @Published var status = Status.loading
    @Published var nowPlayingMovies: [MoviesHomePickerModel]?
    @Published var upcomingMovies: [MoviesHomePickerModel]?
    @Published var popularMovies: [MoviesHomePickerModel]?
    
    var suscriptors = Set<AnyCancellable>()
    var interactor: PickerViewInteractorProtocol
    
    init(
        interactor: PickerViewInteractorProtocol = PickerViewInteractor()
    ){
        self.interactor = interactor
        self.getNowPlayingMovies()
        self.getUpcomingMovies()
        self.getPopularMovies()
    }
    
    func getNowPlayingMovies() {
        interactor.getMoviesPicker(endpoint: .nowPlaying)
            .sink { completion in
                switch completion {
                case .finished:
                    self.status = .loaded
                case .failure:
                    self.status = .error(error: "Error al traer nowplayingmovies")
                }
            } receiveValue: { response in
                self.nowPlayingMovies = response.results
            }
            .store(in: &suscriptors)

    }
    
    func getUpcomingMovies() {
        interactor.getMoviesPicker(endpoint: .upcoming)
            .sink { completion in
                switch completion {
                case .finished:
                    self.status = .loaded
                case .failure:
                    self.status = .error(error: "Error al traer UPCOMING MOVIES")
                }
            } receiveValue: { response in
                self.upcomingMovies = response.results
            }
            .store(in: &suscriptors)
    }
    
    func getPopularMovies() {
        interactor.getMoviesPicker(endpoint: .popular)
            .sink { completion in
                switch completion {
                case .finished:
                    self.status = .loaded
                case .failure:
                    self.status = .error(error: "Error al traer POPULAR MOVIES")
                }
            } receiveValue: { response in
                self.popularMovies = response.results
            }
            .store(in: &suscriptors)
    }
}
