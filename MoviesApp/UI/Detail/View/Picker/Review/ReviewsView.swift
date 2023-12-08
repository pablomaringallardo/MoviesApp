//
//  ReviewsView.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 27/11/23.
//

import SwiftUI

struct ReviewsView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(spacing: 20) {
                    Circle()
                        .frame(width: 44, height: 44, alignment: .leading)
                        .foregroundStyle(.purple)
                        .overlay {
                            Image(systemName: "person")
                        }
                    Text("6.3")
                        .foregroundStyle(.blue)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Pablo Marín")
                        .font(.customFont(name: .poppinsMedium, size: 12))
                        .foregroundStyle(.white)
                    
                    Text("Lorem ipsum dolor sit amet consectetur adipiscing elit aliquam accumsan, quis aenean mauris et feugiat purus...")
                        .font(.customFont(name: .poppinsRegular, size: 12))
                        .foregroundStyle(.white)
                }
                .padding()
            }
            HStack {
                VStack(spacing: 20) {
                    Circle()
                        .frame(width: 44, height: 44, alignment: .leading)
                        .foregroundStyle(.purple)
                        .overlay {
                            Image(systemName: "person")
                        }
                    Text("6.3")
                        .foregroundStyle(.blue)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Pablo Marín")
                        .font(.customFont(name: .poppinsMedium, size: 12))
                        .foregroundStyle(.white)
                    
                    Text("Lorem ipsum dolor sit amet consectetur adipiscing elit aliquam accumsan, quis aenean mauris et feugiat purus...")
                        .font(.customFont(name: .poppinsRegular, size: 12))
                        .foregroundStyle(.white)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ReviewsView()
}
