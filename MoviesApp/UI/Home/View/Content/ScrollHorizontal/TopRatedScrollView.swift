//
//  TopRatedScrollView.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 22/11/23.
//

import SwiftUI
import CachedAsyncImage

struct TopRatedScrollView: View {
    @ObservedObject var viewModel: HomeViewModel
    @StateObject var detailViewModel = DetailViewModel()
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30.18) {
                if let movies = viewModel.topRated {
                    ForEach(Array(movies.enumerated()), id: \.1.id) { index, movie in
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
                                url: URL(string: "\(imageURL)\(movie.poster_path)"), urlCache: .imageCache) { Image in
                                    ZStack {
                                        Image
                                            .resizable()
                                            .frame(width: 144.61, height: 210)
                                            .scaledToFit()
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                        
                                        Text("\(index + 1)")
                                            .foregroundStyle(.secundario)
                                            .font(.system(size: 100))
                                            .bold()
                                            .offset(x: index < 9 ? -60 : -40 , y: 80)
//                                        One()
//                                            .foregroundStyle(.secundario)
//                                            .frame(width: 50, height: 100)
//                                            .offset(x: -68, y: 80)
                                    }
                                } placeholder: {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 144.61, height: 210)
                                        .clipShape(RoundedRectangle(cornerRadius: 16))
                                }
                        }
                    }
                }
            }
            .padding(.horizontal, 34)
            .padding(.bottom)
        }
//        .padding(.bottom)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    TopRatedScrollView(viewModel: HomeViewModel())
}
