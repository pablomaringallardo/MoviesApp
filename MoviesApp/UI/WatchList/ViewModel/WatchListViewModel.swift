//
//  WatchListViewModel.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 27/11/23.
//

import Foundation

final class WatchListViewModel: ObservableObject {
    @Published var myListMovies: [DetailMovie]? = []
}
