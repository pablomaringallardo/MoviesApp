//
//  NowPlayingView.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 4/12/23.
//

import SwiftUI
import CachedAsyncImage

struct NowPlayingView: View {
    @ObservedObject var viewModel: PickerViewModel
    @ObservedObject var detailViewModel: DetailViewModel
    var body: some View {
        ZStack {
            Color.principal
                .ignoresSafeArea()
            
                if let movies = viewModel.nowPlayingMovies {
                    LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: 20, content: {
                        ForEach(movies) { movie in
                            NavigationLink {
                                DetailView(viewModel: detailViewModel)
                                    .toolbar(.hidden)
                                    .onAppear {
                                        detailViewModel.getDetailMovie(id: movie.id)
                                    }
                                    .onDisappear{
                                        detailViewModel.detailMovie = nil
                                    }
                            } label: {
                                CachedAsyncImage(
                                    url: URL(string: "\(imageURL)\(movie.poster_path ?? "")"), urlCache: .imageCache) { Image in
                                        Image
                                            .resizable()
                                            .frame(width: 100, height: 145.92)
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                    } placeholder: {
                                        Image(systemName: "photo")
                                    }
                            }
                        }
                    })
                
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NowPlayingView(viewModel: PickerViewModel(), detailViewModel: DetailViewModel())
}
