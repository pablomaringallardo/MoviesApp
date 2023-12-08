//
//  TabBarView.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 21/11/23.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: Int
    var tabBarItems: [(image: Image, title: String)] = [
            (Image(systemName: "house"), "Home"),
            (Image(systemName: "magnifyingglass"), "Search"),
            (Image(systemName: "list.star"), "Watch list")

        ]
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 90)
                .foregroundStyle(.principal)
                .overlay(alignment: .top) {
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundStyle(.secundario)
                }
            
            HStack {
                ForEach(0...2, id: \.self) { i in
                    Button {
                        withAnimation {
                            selectedTab = i
                        }
                    } label: {
                        VStack(spacing: 8) {
                            tabBarItems[i].image
                                .font(.title2)
                                .colorMultiply(selectedTab == i ? .secundario : .gray)
                                .fontWeight(.light)
                            Text(tabBarItems[i].title)
                                .foregroundStyle(selectedTab == i ? .secundario : .gray)
                                .fontWeight(.light)
                        }
                        .padding(.vertical, 16)
                    }
                    .tint(.gray)
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    TabBarView(selectedTab: .constant(0))
}
