//
//  AppRoutes.swift
//  CoordinatorDemo
//
//  Created by Daniel Serrano on 28/05/26.
//

import Foundation
import SwiftUI

enum AppRoutes: Routable {
    var id: UUID { UUID() }

    case wishList(plants: [Plant])
    case favourites(plants: [Plant])
    case plant(plant: Plant)
    case root
    case appInfo
    case myGarden(plants: [Plant])

    var body: some View {
        switch self {
        case .wishList(let plants):
            MyWishListView(plants: plants)
        case .favourites(let plants):
            CoordinatorStack(root: FavouritesRoutes.root(plants: plants)) // Instantiate child coordinator to manage all new Favourites navigation
        case .plant(let plant):
            PlantDetails(plant: plant)
        case .root:
            MainView()
        case .myGarden(let plants):
            MyGardenView(plants: plants)
        case .appInfo:
            AppInfoView()
        }
    }
}
