//
//  MainViewModel.swift
//  CoordinatorDemo
//
//  Created by Daniel Serrano on 28/05/26.
//

import Foundation

@Observable
class MainViewModel {

    func getFavourites() -> [Plant] {
        var favourites: [Plant] = []
        for plant in Plant.mocks {
            if plant.isFavorite {
                favourites.append(plant)
            }
        }
        return favourites
    }
}
