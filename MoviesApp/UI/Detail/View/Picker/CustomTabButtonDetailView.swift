//
//  CustomTabButtonDetailView.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 27/11/23.
//

import SwiftUI

struct CustomTabButtonDetailView: View {
    
    var title: String
    var index: Int
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.customFont(name: .poppinsMedium, size: 14))
                .background(.principal)
                .foregroundStyle(.white)
                
        }
        .padding()
//        .overlay(alignment: .bottom) {
//            Rectangle()
//                .frame(maxWidth: 145, maxHeight: 4)
//                .foregroundStyle(.gray)
//                .padding(.bottom, 16)
//        }
    }
}

#Preview {
    CustomTabButtonDetailView(title: "About Movie", index: 0, isSelected: true) {
        print("hola")
    }
}
