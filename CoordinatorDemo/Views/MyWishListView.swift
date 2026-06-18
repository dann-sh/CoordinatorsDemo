//
//  MyWishListView.swift
//  CoordinatorDemo
//
//  Created by Daniel Serrano on 28/05/26.
//

import SwiftUI

struct MyWishListView: View {
    @Environment(Coordinator<AppRoutes>.self) private var appCoordinator

    let plants: [Plant]

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack(spacing: 0) {
            if appCoordinator.isSheetPresented {
                HStack {
                    Spacer()
                    Button {
                        appCoordinator.pop(.sheet)
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .tint(.black)
                            .padding(4)
                    }
                    .frame(width: 50, height: 50)
                }
                .padding(.horizontal)
            }

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
                        print(plant.name)
                    }
                }
            }
            .padding()
            }
        }
        .navigationTitle("Mis siguientes plantitas")
    }
}

#Preview {
    MyWishListView(plants: Plant.wishListMocks)
}
