//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 21/11/23.
//

import SwiftUI

@main
struct MoviesAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
