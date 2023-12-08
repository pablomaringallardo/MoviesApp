//
//  MoviesHomePickerModel.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 4/12/23.
//

import Foundation

struct MoviesHomePickerResponse: Codable {
    let results: [MoviesHomePickerModel]
}

struct MoviesHomePickerModel: Codable, Identifiable {
    let id: Int
    let poster_path: String?
}
