//
//  HomeContentView.swift
//  MoviesApp
//
//  Created by Pablo Marín Gallardo on 21/11/23.
//

import SwiftUI

struct HomeContentView: View {
    @ObservedObject var viewModel: HomeViewModel
    @StateObject var pickerViewModel = PickerViewModel()
    @StateObject var detailViewModel = DetailViewModel()
    @State private var searchText = ""
    @State private var selectedSection = 0
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text("Top rated")
                        .font(.customFont(name: .poppinsSemiBold, size: 40))
                        .foregroundStyle(.white)
                        .padding(.leading, 18)
                        .padding(.top, 20)
                        .padding(.bottom, 5)
                        
                    
                    
                    TopRatedScrollView(viewModel: viewModel)
                    
                    HStack(spacing: 20) {
                        CustomTabButtonDetailView(title: "Now playing", index: 0, isSelected: selectedSection == 0) {
                            selectedSection = 0
                        }
                        
                        CustomTabButtonDetailView(title: "Upcoming", index: 1, isSelected: selectedSection == 1) {
                            selectedSection = 1
                        }
                        
                        CustomTabButtonDetailView(title: "Popular", index: 2, isSelected: selectedSection == 2) {
                            selectedSection = 2
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .padding(.vertical)
                    
                    switch selectedSection {
                    case 0:
                        NowPlayingView(viewModel: pickerViewModel, detailViewModel: detailViewModel)
                    case 1:
                        UpcomingView(viewModel: pickerViewModel, detailViewModel: detailViewModel)
                    case 2:
                        PopularView(viewModel: pickerViewModel, detailViewModel: detailViewModel)
                    default:
                        Text("Error")
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.bottom)
                
            }
            .frame(maxHeight: .infinity)
            .scrollIndicators(.hidden)
            .background(.principal)
        }
    }
}


#Preview {
    HomeContentView(viewModel: HomeViewModel())
}
