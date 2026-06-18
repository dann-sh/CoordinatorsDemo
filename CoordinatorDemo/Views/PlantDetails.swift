//
//  PlantDetails.swift
//  CoordinatorDemo
//
//  Created by Daniel Serrano on 28/05/26.
//

import SwiftUI

struct PlantDetails: View {
    @Environment(Coordinator<AppRoutes>.self) private var appCoordinator
    @State private var viewModel = MainViewModel()

    let plant: Plant

    var body: some View {
        List {
            Section {
                VStack(spacing: 8) {
                    Image(plant.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .clipped()

                    Text(plant.registrationDate.formatted(date: .long, time: .omitted))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            Section("Description") {
                Text(plant.description)
            }
            
            Section("Care") {
                Text(plant.care)
            }


            Section("Wish list") {
                Button {
                    appCoordinator.push(.wishList(plants: viewModel.getFavourites()), type: .sheet)
                } label: {
                    Text("Tus futuras plantitas")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 7/255, green: 117/255, blue: 97/255))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
            }
       }
        .navigationTitle(plant.name)
    }
}

#Preview {
    PlantDetails(plant: Plant.mocks[0])
}
