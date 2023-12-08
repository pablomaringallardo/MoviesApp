//
//  Globals.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 21/11/23.
//

import Foundation

let baseURL = "https://api.themoviedb.org/3/"
let imageURL = "https://image.tmdb.org/t/p/w500"
let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZWY2YjZjMGYwNDY1MzM4ODk0YjRkODNiMmMzMjYwYiIsInN1YiI6IjY1NWNkYTNjZjY3ODdhMDBlMzBkMTQzYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.D8TZl59jXo_Vyy8inrJMljwF78YoKIS4s8_DIYM1E8A"


enum EndpointPicker: String {
    case upcoming = "movie/upcoming"
    case nowPlaying = "movie/now_playing"
    case popular = "movie/popular"
}
