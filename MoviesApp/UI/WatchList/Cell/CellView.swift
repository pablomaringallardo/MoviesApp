//
//  CellView.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 27/11/23.
//

import SwiftUI
import CachedAsyncImage

struct CellView: View {
    var movie: DetailMovie
    var body: some View {
        HStack {
            CachedAsyncImage(
                url: URL(string: "\(imageURL)\(movie.poster_path)")) { Image in
                    Image
                        .resizable()
                        .frame(width: 95, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 95, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .font(.customFont(name: .poppinsRegular, size: 16))
                    .lineLimit(1)
                    .padding(.bottom, 10)
                
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
                
                HStack(spacing: 4) {
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text(Date.getYear(date: movie.release_date))                        .font(.customFont(name: .montserrat, size: 12))
                        .fontWeight(.medium)
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text(String("\(movie.runtime) Minutes"))
                        .font(.customFont(name: .montserrat, size: 12))
                        .fontWeight(.medium)
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "ticket")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text(movie.genres[0].name)
                        .font(.customFont(name: .montserrat, size: 12))
                        .fontWeight(.medium)
                }
            }
            .foregroundStyle(.white)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 130)
        .background(.principal)
    }
}

#Preview {
    CellView(movie: .previewDetail)
}
