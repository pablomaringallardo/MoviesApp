//
//  DetailView.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 22/11/23.
//

import SwiftUI
import CachedAsyncImage

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = DetailViewModel()
    @State private var selectedSection = 0
    @State private var isSave: Bool = false
//    var movie: MovieTopRated
    var body: some View {
        ZStack {
            Color.principal
                .ignoresSafeArea()
            
            VStack {
                //cabezera
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                            .font(.title2)
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                    Text("Detail")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .font(.customFont(name: .montserrat, size: 16))
                        .fontWeight(.semibold)
                    
                    Button(action: {
                        isSave.toggle()
                    
                    }, label: {
                        Image(systemName: isSave ? "minus.square.fill" : "plus.app")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                    })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    
                }
                .padding(.horizontal)
                
                //imagenes peli y titulo
                if let movie = viewModel.detailMovie {
                    CachedAsyncImage(url: URL(string:"\(imageURL)\(movie.backdrop_path)"), urlCache: .imageCache) { image in
                        image
                            .resizable()
                            .frame(width: .infinity, height: 210.94)
                            .clipShape(
                                .rect(cornerRadii:
                                        RectangleCornerRadii(
                                            topLeading: 0,
                                            bottomLeading: 20,
                                            bottomTrailing: 20,
                                            topTrailing: 0
                                        )))
                            .overlay(alignment: .bottomTrailing) {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 54, height: 24)
                                    .padding()
                                    .foregroundStyle(.ultraThinMaterial)
                                    
                                HStack(spacing: 3) {
                                    Image(systemName: "star")
                                        .font(.customFont(name: .montserrat, size: 12))
                                        .fontWeight(.semibold)
                                    let numFav = Double(Int(movie.vote_average*10))/10
                                    Text(numFav.formatted(.number))
                                        .font(.callout)
                                }
                                .foregroundStyle(.orangeFavorite)
                                .fontWeight(.semibold)
                            }
                            .overlay {
                                HStack {
                                    CachedAsyncImage(
                                        url: URL(string: "\(imageURL)\(movie.poster_path)"), urlCache: .imageCache) { Image in
                                            Image
                                                .resizable()
                                                .frame(width: 95, height: 120)
                                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                        } placeholder: {
                                            Image(systemName: "photo")
                                        }
                                    
                                    Text(movie.title)
                                        .foregroundStyle(.white)
                                        .font(.customFont(name: .poppinsSemiBold, size: 24))
                                        .lineLimit(2)
                                        .frame(maxHeight: 70, alignment: .bottom)
                                        .padding(.top, 55)
                                }
                                .offset(y: 110)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 29)
                                
                            }
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 360, height: 200)
                            .foregroundStyle(.gray)
                    }
                    
                    //fecha lanzamiento, duracion, tipo
                    HStack(spacing: 15) {
                        HStack(spacing: 4) {
                            Image(systemName: "calendar")
                            Text(Date.getYear(date: movie.release_date))
                                
                                .font(.customFont(name: .montserrat, size: 12))
                            .fontWeight(.medium)
                        }
                        
                        Text("|")
                        
                        HStack(spacing: 4) {
                            Image(systemName: "clock")
                            Text(String("\(movie.runtime) Minutes"))
                                
                                .font(.customFont(name: .montserrat, size: 12))
                            .fontWeight(.medium)
                        }
                        
                        Text("|")
                        
                        HStack(spacing: 4) {
                            Image(systemName: "ticket")
                            Text(movie.genres[0].name)
                                
                                .font(.customFont(name: .montserrat, size: 12))
                            .fontWeight(.medium)
                        }
                    }
                    .foregroundStyle(.gray)
                    .padding(.top, 80)
                    
                    //tabview
                    
                    HStack(spacing: 20) {
                        CustomTabButtonDetailView(title: "About Movie", index: 0, isSelected: selectedSection == 0) {
                            selectedSection = 0
                        }
                        
                        CustomTabButtonDetailView(title: "Reviews", index: 1, isSelected: selectedSection == 1) {
                            selectedSection = 1
                        }
                        
                        CustomTabButtonDetailView(title: "Cast", index: 2, isSelected: selectedSection == 2) {
                            selectedSection = 2
                        }
                        .onAppear {
                            viewModel.getCreditsMovie(id: movie.id)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top)
                    
                    switch selectedSection {
                    case 0:
                        withAnimation {
                            Text(movie.overview)
                                .padding()
                                .font(.customFont(name: .poppinsRegular, size: 16))
                                .foregroundStyle(.white)
                        }
                    case 1:
                        ReviewsView()
                            .padding(.horizontal)
                    case 2:
                        if let actors = viewModel.actors {
                            CastView(actors: actors)
                        } else {
                            Text("Actors not available")
                                .foregroundStyle(.gray)
                                .font(.customFont(name: .montserrat, size: 16))
                                .italic()
                        }
                    default:
                        Text("error")
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(testing: true))
}
