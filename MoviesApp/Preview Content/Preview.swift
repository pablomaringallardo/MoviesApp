//
//  Preview.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 22/11/23.
//

import Foundation

extension MovieTopRated {
    static let previewMovie = MovieTopRated(id: 238, adult: false, backdrop_path: "/tmU7GeKVybMWFButWEGl2M4GeiP.jpg", genre_ids: [18, 80], original_title: "The Godfather", overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.", popularity: 147.852, poster_path: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg", release_date: "1972-03-14", title: "The Godfather", vote_average: 8.708, vote_count: 18973)
}

extension DetailMovie {
    
    static let previewDetail = DetailMovie(
        id: 122,
        title: "The Lord of the Rings: The Return of the King",
        overview: "Aragorn is revealed as the heir to the ancient kings as he, Gandalf and the other members of the broken fellowship struggle to save Gondor from Sauron's forces. Meanwhile, Frodo and Sam take the ring closer to the heart of Mordor, the dark lord's realm.",
        poster_path: "/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg",
        backdrop_path: "/9DeGfFIqjph5CBFVQrD6wv9S7rR.jpg",
        genres: [
            Genre(id: 12, name: "Adventure"),
            Genre(id: 14, name: "Fantasy"),
            Genre(id: 28, name: "Action")
        ],
        runtime: 201,
        vote_average: 8.5,
        release_date: "2003-12-01"
    )
}

extension CreditsModel {
    
    static let previewCast = [
        CreditsModel(
            original_name: "Elijah Wood",
            profile_path: "/7UKRbJBNG7mxBl2QQc5XsAh6F8B.jpg"
        ),
        CreditsModel(
            original_name: "Sean Astin",
            profile_path: "/5oJzy6Ra0tuMEV7mfxjtqye5qUX.jpg"
        ),
        CreditsModel(
            original_name: "Ian McKellen",
            profile_path: "/coWjgMEYJjk2OrNddlXCBm8EIr3.jpg"
        ),
        CreditsModel(
            original_name: "Viggo Mortensen",
            profile_path: "/vH5gVSpHAMhDaFWfh0Q7BG61O1y.jpg"
        ),
        CreditsModel(
            original_name: "Andy Serkis",
            profile_path: "/eNGqhebQ4cDssjVeNFrKtUvweV5.jpg"
        )
    ]
}
