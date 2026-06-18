//
//  CoordinatorDemoApp.swift
//  CoordinatorDemo
//
//  Created by Daniel Serrano on 28/05/26.
//

import SwiftUI

@main
struct CoordinatorDemoApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorStack(root: AppRoutes.root)
        }
    }
}
