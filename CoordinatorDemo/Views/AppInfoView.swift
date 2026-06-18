//
//  AppInfoView.swift
//  CoordinatorDemo
//
//  Created by Daniel Serrano on 28/05/26.
//

import SwiftUI

struct AppInfoView: View {
    @Environment(Coordinator<AppRoutes>.self) private var appCoordinator

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    appCoordinator.pop(.fullScreenCover)
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .tint(Color.black)
                        .symbolVariant(.fill)
                        .padding(4)
                }
                .frame(width: 50, height: 50)
            }
            .padding()
            Text("Aplicacion demo para ilustrar el uso del patron coordinator para optimizar la navegación y separar esta responsabilidad de las vistas lo que nos permite mejor testabilidad y escalabilidad, este demo maneja las navegaciones básicas, modales tipo .sheet y .fullSreen asi como el .push")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
            Text("v 1.0.0")
                .font(.body)
        }
    }
}

#Preview {
    AppInfoView()
}
