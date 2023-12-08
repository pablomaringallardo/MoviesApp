//
//  StatusModel.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 22/11/23.
//

import Foundation

enum Status {
    case loading, loaded, error(error: String)
}
