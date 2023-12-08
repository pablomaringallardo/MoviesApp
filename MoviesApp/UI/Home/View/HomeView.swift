//
//  HomeView.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 21/11/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var selectedTab = 0
    var body: some View {
        
        //        switch viewModel.status {
        //            case .loading:
        //                Text("Cargando")
        //            case .loaded:
        //                HomeView()
        //            case .error(error: let error):
        //                Text(error)
        //        }
        
        
        TabView(selection: $selectedTab) {
            HomeContentView(viewModel: viewModel)
                .navigationTitle("Movies")
                .tag(0)
            
            Text("Content 2")
                .tag(1)
            
            WatchListView()
                .tag(2)
        }
        .overlay(alignment: .bottom) {
            TabBarView(selectedTab: $selectedTab)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
