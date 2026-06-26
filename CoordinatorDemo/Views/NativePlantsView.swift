//
//  NativePlantsView.swift
//  CoordinatorDemo
//
//  Created by Daniel Serrano on 26/06/26.
//

import SwiftUI

struct NativePlantsView: View {
    @Environment(Coordinator<AppRoutes>.self) private var appCoordinator
    @State private var viewModel = NativePlantsViewModel()
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                Image("my_garden_header")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                    .clipped()
                
                if viewModel.isLoading {
                    ProgressView()
                        .padding(.top, 40)
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                        .padding()
                } else {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.plants) { plant in
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
                                appCoordinator.push(.plant(plant: plant), type: .push)
                            }
                        }
                    }
                    .padding()
                }
            }
            
            Button {
                Task {
                    await viewModel.getNativePlants()
                }
             } label: {
                 Label("Reload plants", systemImage: "arrow.clockwise")
                     .frame(maxWidth: .infinity, minHeight: 50)
                     .foregroundStyle(.white)
                     .background(Color(red: 0/255, green: 171/255, blue: 140/255))
                     .clipShape(RoundedRectangle(cornerRadius: 12))
                     .overlay(
                         RoundedRectangle(cornerRadius: 12)
                             .stroke(Color(red: 0/255, green: 171/255, blue: 140/255), lineWidth: 1)
                     )
             }
             .disabled(viewModel.isLoading)
             .padding(.horizontal)
             .padding(.top)

            Button {
                viewModel.cancelFetch()
             } label: {
                 Label("Cancel task example", systemImage: "xmark.circle.fill")
                     .frame(maxWidth: .infinity, minHeight: 50)
                     .foregroundStyle(.white)
                     .background(Color(red: 7/255, green: 117/255, blue: 97/255))
                     .clipShape(RoundedRectangle(cornerRadius: 12))
                     .overlay(
                         RoundedRectangle(cornerRadius: 12)
                             .stroke(Color(red: 7/255, green: 117/255, blue: 97/255), lineWidth: 1)
                     )
             }
             .disabled(!viewModel.isLoading)
             .padding()
        }
        .navigationTitle("Native Plants")
        // The .task usually runs on the thread where this was called in this case was on the @Mainactor
        // so any @Observable state updates inside getNativePlants() are safely to trigger UI updates
        // without extra DispatchQueue.main calls.
        //
        // The execution is split across threads at suspension points (await), this is how task is executing:
        //
        //   Main thread:  .task kicks off → calls getNativePlants() → hits `await URLSession.shared.data(from:)`
        //                                                                           ↓
        //   Background:                                              network request runs here (URLSession manages its own threads)
        //                                                                           ↓
        //   Main thread:  resumes after await → decodes JSON → assigns `plants = response.plants` → UI updates
        //
        // - The network call does NOT block the main thread
        //   Swift suspends the task at each `await`, freeing the main thread while I/O is in flight.
        // - JSON decoding happens on resume, which is back on the MainActor.
        // - Assigning to `plants` triggers @Observable on the main thread, which is exactly
        //   where UI updates must happen
        .task {
            await viewModel.getNativePlants()
        }
    }
}

#Preview {
    NativePlantsView()
        .environment(Coordinator<AppRoutes>())
}
