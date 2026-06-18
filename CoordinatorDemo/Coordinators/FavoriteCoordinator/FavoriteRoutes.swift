//
//  FavoriteRoutes.swift
//  CoordinatorDemo
//
//  Created by Daniel Serrano on 28/05/26.
//

import Foundation
import SwiftUI

enum FavouritesRoutes: Routable {

    var id: UUID { UUID() }

    case root(plants: [Plant])
    case wishList(plants: [Plant])
    case plant(plant: Plant)

    var body: some View {
        switch self {
        case .root(let plants):
            FavouritesView(plants: plants)
        case .wishList(let plants):
            MyWishListView(plants: plants)
        case .plant(let plant):
            PlantDetails(plant: plant)
        }
    }
}
