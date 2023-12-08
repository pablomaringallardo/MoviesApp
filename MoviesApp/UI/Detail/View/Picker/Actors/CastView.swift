//
//  CastView.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 27/11/23.
//

import SwiftUI
import CachedAsyncImage

struct CastView: View {
    var actors: [CreditsModel]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem()], spacing: 50) {
                ForEach(actors, id: \.self) { actor in
                    VStack {
                        if let image = actor.profile_path {
                            CachedAsyncImage(
                                url: URL(string: "\(imageURL)\(image)"), urlCache: .imageCache) { Image in
                                    Image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        
                                } placeholder: {
                                    Circle()
                                        .frame(width: 100, height: 100)
                                        .foregroundStyle(.secundario)
                                    
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundStyle(.principal)
                                }
                        } else {
                            ZStack {
                                Circle()
                                    .frame(width: 100, height: 100)
                                    .foregroundStyle(.secundario)
                                
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundStyle(.principal)
                                
                            }
                        }
                        
                        Text(actor.original_name)

                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    CastView(actors: [
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
    ])
}
