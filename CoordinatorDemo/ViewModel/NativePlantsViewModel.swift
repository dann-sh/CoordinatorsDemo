//
//  NativePlantsViewModel.swift
//  CoordinatorDemo
//
//  Created by Daniel Serrano on 25/06/26.
//

import Foundation

/*
 @MainActor is applied to the entire view model class.
 This ensures all published properties and UI state mutations
 stay safely on the main thread
 */
@MainActor
@Observable
class NativePlantsViewModel {

    var plants: [Plant] = []
    var isLoading: Bool = false
    var errorMessage: String? = nil

    // Holds a reference to the active fetch task so it can be cancelled externally.
    // The task is assigned from the view's .task modifier, giving us a handle to cancel it
    // on demand (e.g. when the user taps the "Cancel task" button).
    private var fetchTask: Task<Void, Never>?

    func getNativePlants() async {
        // Store the current task so cancelFetch() can reach it
        fetchTask = Task {
            isLoading = true
            errorMessage = nil

            do {
                guard let url = URL(string: "https://raw.githubusercontent.com/dann-sh/animeJsonTestApi/refs/heads/main/plants.json") else {
                    errorMessage = "Invalid URL"
                    isLoading = false
                    return
                }

                // Simulates a slow network response of ~3 seconds
                try await Task.sleep(for: .seconds(3))

                // Check if cancelled during the sleep before making the real network call
                try Task.checkCancellation()

                let (data, _) = try await URLSession.shared.data(from: url)

                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601

                let response = try decoder.decode(PlantsResponse.self, from: data)
                plants = response.plants

            } catch is CancellationError {
                // Task was cancelled by the user — expected, not an error
                errorMessage = "Request cancelled"
            } catch {
                errorMessage = "Failed to load plants: \(error.localizedDescription)"
            }

            isLoading = false
        }

        // Await the internal task so the .task modifier stays suspended
        // (and can propagate its own cancellation down to fetchTask)
        await fetchTask?.value
    }

    // Cancels the in-flight fetch task.
    // Called when the user taps the "Cancel task example" button.
    func cancelFetch() {
        fetchTask?.cancel()
        fetchTask = nil
    }
}

// MARK: - Decodable response wrapper

private struct PlantsResponse: Decodable {
    let plants: [Plant]
}
