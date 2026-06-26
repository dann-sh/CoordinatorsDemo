//
//  PlantsServiceNetwork.swift
//  CoordinatorDemo
//
//  Created by Daniel Serrano on 25/06/26.
//

import Foundation

func fetchGitHubJSON() async {
    // 1. Get the Raw URL of your GitHub JSON file
    guard let url = URL(string: "https://raw.githubusercontent.com/dann-sh/animeJsonTestApi/refs/heads/main/plants.json") else {
        print("Invalid URL")
        return
    }
    
    do {
        // 2. Fetch the data from the network
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // 3. Decode the JSON data into your Swift struct
        let decodedData = try JSONDecoder().decode(Plant.self, from: data)
        print("Successfully fetched: \(decodedData.name)")
        
    } catch {
        print("Failed to fetch or decode JSON: \(error.localizedDescription)")
    }
}
