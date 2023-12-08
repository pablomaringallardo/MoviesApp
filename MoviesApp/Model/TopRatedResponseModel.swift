//
//  TopRatedResponseModel.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 21/11/23.
//

import Foundation

struct TopRatedResponseModel: Codable {
    let results: [MovieTopRated]
}

struct MovieTopRated: Codable, Hashable {
    let id: Int
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let title: String
    let vote_average: Double
    let vote_count: Int
}

