//
//  DetailMovieModel.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 24/11/23.
//

import Foundation

struct DetailMovie: Codable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String
    let backdrop_path: String
    let genres: [Genre]
    let runtime: Int
    let vote_average: Double
    let release_date: String
}

struct Genre: Codable, Hashable {
    let id: Int
    let name: String
}
