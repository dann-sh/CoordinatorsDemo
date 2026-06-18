//
//  MainView.swift
//  CoordinatorDemo
//
//  Created by Daniel Serrano on 28/05/26.
//

import SwiftUI

struct MainView: View {
    @Environment(Coordinator<AppRoutes>.self) private var appCoordinator
    @State private var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    appCoordinator.push(.wishList(plants: Plant.wishListMocks), type: .push)
                    print("Wish List")
                } label: {
                    Label("Wish List", systemImage: "star.fill")
                        .frame(maxWidth: .infinity, minHeight: 80)
                        .foregroundStyle(.white)
                        .background(Color(red: 7/255, green: 117/255, blue: 97/255))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(red: 7/255, green: 117/255, blue: 97/255), lineWidth: 1)
                        )
                }
                
                Button {
                    appCoordinator.push(.myGarden(plants: Plant.mocks), type: .push)
                } label: {
                    Label("My Garden", systemImage: "leaf.fill")
                        .frame(maxWidth: .infinity, minHeight: 80)
                        .foregroundStyle(.white)
                        .background(Color(red: 7/255, green: 117/255, blue: 97/255))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(red: 7/255, green: 117/255, blue: 97/255), lineWidth: 1)
                        )
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Gardening Tips")
                    .font(.headline)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 12) {
                        Text("💧 Water in the morning to reduce evaporation.")
                            .frame(width: 300, height: 80)
                            .background(Color(.systemGray6))
                        Text("☀️ Most vegetables need at least 6 hours of sunlight.")
                            .frame(width: 300, height: 80)
                            .background(Color(.systemGray6))
                        Text("🌱 Use compost to enrich your soil naturally.")
                            .frame(width: 300, height: 80)
                            .background(Color(.systemGray6))
                        Text("✂️ Prune dead leaves to encourage new growth.")
                            .frame(width: 300, height: 80)
                            .background(Color(.systemGray6))
                        Text("🪱 Earthworms are a sign of healthy soil.")
                            .frame(width: 300, height: 80)
                            .background(Color(.systemGray6))
                    }
                    .padding(.horizontal)
                }
                .frame(height: 100)
            }
            .padding(.vertical)
            
            Image("main_image")
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 350)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            Spacer()
        }
        .background(Color(red: 45/255, green: 84/255, blue: 77/255).ignoresSafeArea())
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    appCoordinator.push(.favourites(plants: viewModel.getFavourites()), type: .sheet)
                } label: {
                    Image(systemName: "heart")
                        .symbolVariant(.fill)
                        .padding(4)
                }
            }
            ToolbarItem(placement: .primaryAction) {
                Button {
                    appCoordinator.push(.appInfo, type: .fullScreenCover)
                } label: {
                    Image(systemName: "info.circle")
                        .padding(4)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
