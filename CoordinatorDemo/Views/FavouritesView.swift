//
//  FavouritesView.swift
//  CoordinatorDemo
//
//  Created by Daniel Serrano on 28/05/26.
//

import SwiftUI

struct FavouritesView: View {
    @Environment(Coordinator<AppRoutes>.self) private var appCoordinator
    @Environment(Coordinator<FavouritesRoutes>.self) private var favouritesCoordinator

    let plants: [Plant]

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(plants) { plant in
                    VStack(spacing: 8) {
                        Image(plant.image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 120)
                            .clipped()

                        Text(plant.name)
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 8)
                    }
                    .background(Color(red: 0/255, green: 171/255, blue: 140/255))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(red: 0/255, green: 171/255, blue: 140/255), lineWidth: 1)
                    )
                    .onTapGesture {
                        favouritesCoordinator.push(.plant(plant: plant), type: .push)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Favourites")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    appCoordinator.pop(.sheet)
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .symbolVariant(.fill)
                        .padding(4)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FavouritesView(plants: Plant.mocks)
            .environment(Coordinator<FavouritesRoutes>())
            .environment(Coordinator<AppRoutes>())
    }
}
