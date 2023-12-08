//
//  CreditsModel.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 27/11/23.
//

import Foundation

struct Response: Codable {
    let cast: [CreditsModel]
}

struct CreditsModel: Codable, Hashable {
    let original_name: String
    let profile_path: String?
}
