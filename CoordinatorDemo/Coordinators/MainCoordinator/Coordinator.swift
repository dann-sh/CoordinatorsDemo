//
//  Coordinator.swift
//  CoordinatorDemo
//
//  Created by Daniel Serrano on 28/05/26.
//

import Foundation
import SwiftUI

@Observable
class Coordinator<Route: Routable> {

    var path: NavigationPath = NavigationPath()
    var sheet: Route?
    var fullscreenCover: Route?

    var isSheetPresented: Bool { sheet != nil }

    enum NavigationType {
        case push
        case sheet
        case fullScreenCover
    }

    enum NavigationPopType {
        case push(last: Int)
        case sheet
        case fullScreenCover
    }

    func push(_ page: Route, type: NavigationType = .push) {
        switch type {
        case .push:
            path.append(page)
        case .sheet:
            sheet = page
        case .fullScreenCover:
            fullscreenCover = page
        }
    }

    func pop(_ type: NavigationPopType = .push(last: 1)) {
        switch type {
        case .push(let last):
            path.removeLast(last)
        case .sheet:
            sheet = nil
        case .fullScreenCover:
            fullscreenCover = nil
        }
    }

    func reset() {
        path.removeLast(path.count)
    }
}
