//
//  SearchBarView.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 22/11/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(.tabBarGray.opacity(0.3))
            .frame(height: 42)
            .overlay {
                TextField("", text: $searchText)
                    .padding()
                
                HStack {
                    Text("Search...")
                    Spacer()
                    Image(systemName: "magnifyingglass")
                }
                .foregroundStyle(.gray)
                .padding()
            }
    }
}
//#Preview {
//    SearchBarView(searchText: $searchText)
//}
